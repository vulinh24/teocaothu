//package com.shopteocaothu.controllers.admin;
//
//import java.io.File;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.shopteocaothu.SolveException.CustomException;
//import com.shopteocaothu.entities.Skin;
//import com.shopteocaothu.repositories.SkinRepository;
//
//@Controller
//public class CreateSkin {
//
//	@Autowired
//	private SkinRepository skinRepo;
//
//	@RequestMapping(value = { "/admin/create-skin" }, method = RequestMethod.GET)
//	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
//			throws Exception {
//		
//		return "back-end/create_skin";
//	}
//
//	@Transactional
//	@RequestMapping(value = {"/admin/create-skin"}, method = RequestMethod.POST )
//	public String add(@RequestParam(name = "skin_image") MultipartFile files[], final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
//		try {
//			List<Skin> skins = new ArrayList<>();
//			for (MultipartFile file : files) {
//				String name = file.getOriginalFilename();
//				name = name.substring(0,name.length()-4);
//				skins.add(new Skin(null,name,file.getOriginalFilename()));
//				file.transferTo(new File("C:/Users/linh/Downloads/img/copiedskin/" + file.getOriginalFilename()));
//				File old = new File("C:/Users/linh/Downloads/img/skin/" + file.getOriginalFilename());
//				old.delete();
//			}
//			skinRepo.saveAll(skins);
//			return "back-end/create_skin";
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new CustomException();
//		}
//	}
//
//}
