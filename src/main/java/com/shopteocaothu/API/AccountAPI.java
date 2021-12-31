package com.shopteocaothu.API;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shopteocaothu.entities.Account;
import com.shopteocaothu.model.AccountModel;
import com.shopteocaothu.model.ThongKe;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.SelledAccRepository;

@RestController
public class AccountAPI {

	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	SelledAccRepository selledAccRepository;

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/api/account-detail/{id}", method = RequestMethod.GET)
	public ResponseEntity detailaccount(@PathVariable Integer id) {
		try {
			Account acc = accountRepository.getById(id);
			AccountModel accModel = new AccountModel(acc.getId(), acc.getIngame(), acc.getLevel(), acc.getNumOfChamp(),
					acc.getSellPrice(), acc.getCategory().getName(), acc.getRank().getName(), acc.getDescription(),acc.getNumSkin());
			return ResponseEntity
					.status(HttpStatus.OK)
					.body(accModel);
		} catch (Exception e) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
					.body("có lỗi");
		}
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/api/thong-ke", method = RequestMethod.GET)
	public ResponseEntity thongke() {
		try {
			ThongKe tk = new ThongKe();
			tk.setCountDay(selledAccRepository.countByDate());
			tk.setCountMonth(selledAccRepository.countByMonth());
			tk.setSumDay(selledAccRepository.sumByDate());
			Long month = selledAccRepository.sumByMonth();
			tk.setSumMonth(month);
			tk.setMonthInterest(month - selledAccRepository.sumImportMonth());
			tk.setTotalInterest(selledAccRepository.sumSellTotal() - selledAccRepository.sumImportTotal());
			return ResponseEntity
					.status(HttpStatus.OK)
					.body(tk);
		} catch (Exception e) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
					.body("có lỗi");
		}
	}

}
