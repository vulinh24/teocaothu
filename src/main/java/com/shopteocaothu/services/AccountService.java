package com.shopteocaothu.services;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shopteocaothu.entities.Account;
import com.shopteocaothu.entities.AccountImages;
import com.shopteocaothu.entities.SkinOfAccount;
import com.shopteocaothu.entities.primarykey.PKOfSkin;
import com.shopteocaothu.model.FilterModel;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.ImageRepository;
import com.shopteocaothu.repositories.SkinAccountRepository;
import com.shopteocaothu.WebConstants;

@Service
public class AccountService {

	@Autowired
	EntityManager entityManager;
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	ImageRepository imageRepository;
	
	@Autowired
	SkinAccountRepository skinAccRepository;
	
	public AccountService() {
	}

	@SuppressWarnings("unchecked")
	public List<Account> filterAccount(final FilterModel proFilter) {
		StringBuilder sql = new StringBuilder("FROM Account p WHERE 1=1");
		if (proFilter.getCategory() != 0)
			sql.append(" AND p.category.id = " + proFilter.getCategory());
		if (proFilter.getRank() != 0)
			sql.append(" AND p.rank.id = " + proFilter.getRank());
		
		if (proFilter.getPrice() != 0) {
			switch(proFilter.getPrice()) {
				case 1 :
					sql.append(" AND p.sellPrice <= 100000");
					break;
				case 2 :
					sql.append(" AND p.sellPrice BETWEEN 100000 AND 300000");
					break;
				case 3 :
					sql.append(" AND p.sellPrice BETWEEN 300000 AND 500000");
					break;
				case 4 :
					sql.append(" AND p.sellPrice >= 500000");
					break;
			}
		}
		
		if (proFilter.getSort() != 0) {
			if (proFilter.getSort() == 1) sql.append(" ORDER BY p.sellPrice desc");
			else sql.append(" ORDER BY p.sellPrice asc");
		}
		
		Query query = entityManager.createQuery(sql.toString());
		if (proFilter.getCurrenPage() == 1) {
			List<Account> initializeAccounts = query.getResultList();
			proFilter.setTotalPage((int) Math.ceil((double) initializeAccounts.size() / WebConstants.NUM_OF_AccountS));
		}
		query.setFirstResult((proFilter.getCurrenPage() - 1) * WebConstants.NUM_OF_AccountS);
		query.setMaxResults(WebConstants.NUM_OF_AccountS);
		return query.getResultList();
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;
		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;
		return false;
	}
	
	@Transactional
	public void save(MultipartFile[] accountImages, Account account, HttpServletRequest request) throws IllegalStateException, IOException {
		
		if(account.getId() != null) { // chỉnh sửa
			account.setSkins(accountRepository.getById(account.getId()).getSkins());
			if(!isEmptyUploadFile(accountImages)) { // nếu admin sửa ảnh sản phẩm
				// lấy danh sách ảnh cũ của sản phẩm
				List<AccountImages> oldAccountImages = imageRepository.findByAccount(account);
				
				// xoá ảnh cũ trên vật lí(host)
				for(AccountImages _image : oldAccountImages) {
					new File(WebConstants.IMG_URL + _image.getPath()).delete();
				}
				
				// xoá ảnh trên database
				imageRepository.deleteAll(oldAccountImages);
				for (MultipartFile accountImage : accountImages) {
					
					// lưu vật lí
					accountImage.transferTo(new File(WebConstants.IMG_URL + accountImage.getOriginalFilename()));
	
					AccountImages _accountImages = new AccountImages();
					_accountImages.setPath(accountImage.getOriginalFilename());
					_accountImages.setAccount(account);
					imageRepository.save(_accountImages);
				}
				
			}
			account.setCreatedBy((String)request.getSession().getAttribute("USER"));
			if(account.getCreatedDate() == null) account.setCreatedDate(Date.valueOf(LocalDate.now()));
			accountRepository.save(account);
		} else {
			if(account.getCreatedDate() == null) account.setCreatedDate(Date.valueOf(LocalDate.now()));
			account.setCreatedBy((String)request.getSession().getAttribute("USER"));
			Account newAccount  = accountRepository.save(account);
			String[] listskins = request.getParameterValues("listskins");
			if (listskins != null) {
				List<SkinOfAccount> skinsOfAcc = new ArrayList<>();
				for (String skin : listskins) {
					PKOfSkin pk = new PKOfSkin(newAccount.getId(),Integer.valueOf(skin));
					skinsOfAcc.add(new SkinOfAccount(pk));
				}
				skinAccRepository.saveAll(skinsOfAcc);
			}
			if (!isEmptyUploadFile(accountImages)) { // có upload ảnh lên.
				for (MultipartFile accountImage : accountImages) {
	
					// lưu vật lí
					accountImage.transferTo(new File(WebConstants.IMG_URL + accountImage.getOriginalFilename()));
	
					AccountImages _accountImages = new AccountImages();
					_accountImages.setPath(accountImage.getOriginalFilename());
					_accountImages.setAccount(newAccount);
					imageRepository.save(_accountImages);
				}
			}
		}
	}
}
