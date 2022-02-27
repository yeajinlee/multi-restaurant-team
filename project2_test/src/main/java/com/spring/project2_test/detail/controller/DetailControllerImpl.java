package com.spring.project2_test.detail.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.detail.service.DetailService;
import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.member.vo.MemberVO;

@Controller("detailController")
public class DetailControllerImpl implements DetailController {


	private static final String REVIEW_IMG_REPO = "E:\\spring_boot\\project2_test2\\src\\main\\webapp\\resources\\image";


	
	@Autowired
	private DetailService detailService;
	
	@Autowired
	private DetailVO detailVO;
	
	
	@Override
	@RequestMapping(value="/detail.do", method = RequestMethod.GET)
	public ModelAndView detailView(@RequestParam("rest_NO") int rest_NO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(rest_NO);
		Map detailMap = detailService.detailContent(rest_NO);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("detailMap", detailMap);
		List detailImg = detailService.detailImage(rest_NO);
		mav.addObject("detailImg", detailImg);
		List detailReviewList = detailService.reviewList(rest_NO);
		mav.addObject("detailReviewList", detailReviewList);
		List detailSideList = detailService.detailSideList();
		mav.addObject("detailSideList", detailSideList);
		int reviewCnt = detailService.reviewCount(rest_NO);
		mav.addObject("reviewCnt", reviewCnt);
		return mav;
	}
		
	
	@Override
	@RequestMapping(value="/addNewReview.do", method= {RequestMethod.POST, RequestMethod.GET}, headers = ("content-type=multipart/*"))
	@ResponseBody
	public ResponseEntity writeReview(DetailReviewVO detailReviewVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)



			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String msg = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

		String img_FileName = null;

		


		HttpSession sess = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) sess.getAttribute("member");
		String user_ID = memberVO.getUser_ID();
		detailReviewVO.setUser_ID(user_ID);

		System.out.println(user_ID);

//		List<String> imgNameList = addImages(multipartRequest);
//		List<ImageVO> imgFileList = new ArrayList<ImageVO>();
//		if(imgNameList != null && imgNameList.size() != 0) {
//			for (String imgName : imgNameList) {
//				ImageVO imageVO = new ImageVO();
//				imageVO.setImg_FileName(imgName);
//				imgFileList.add(imageVO);
//			}
//			reviewMap.put("imgFileList", imgFileList);
//		}
		
//		int rest_NO = detailService.selectRestNO();
		try {
//			int review_NO = detailService.writeReview(reviewMap);
//			if(imgFileList != null && imgFileList.size() != 0) {
//				for(ImageVO imageVO : imgFileList) {
//					img_FileName = imageVO.getImg_FileName();
//					File srcFile = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
//					File desDir = new File(REVIEW_IMG_REPO + "\\" + review_NO);
//					FileUtils.moveToDirectory(srcFile, desDir, true);
//				}
//			}
			detailService.addNewReview(detailReviewVO);
			
			msg = "<script>";
			msg += "alert('COMPLETE');";

			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailReviewVO.getRest_NO() +"';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {

//			if(imgFileList != null && imgFileList.size() != 0) {
//				for(ImageVO imageVO : imgFileList) {
//					img_FileName = imageVO.getImg_FileName();
//					File src = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
//					src.delete();
//				} 
//			}
			msg = "<script>";
			msg += "alert('Try Again')";

			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailReviewVO.getRest_NO() +"';";

			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
		
		
	}


	private String addImages(MultipartHttpServletRequest multipartRequest) throws Exception{
		String img_FileName=null;
		Iterator<String> imgFileNames = multipartRequest.getFileNames();
		while (imgFileNames.hasNext()) {
			String imgFileName = imgFileNames.next();
			MultipartFile mpf = multipartRequest.getFile(imgFileName);
			img_FileName = mpf.getOriginalFilename();
		}
		return img_FileName;
	}

	@Override
	@RequestMapping(value="/deleteReview.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ResponseEntity deleteReview(@RequestParam("rest_NO") int rest_NO, DetailReviewVO detailReviewVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			
			detailService.deleteReview(detailReviewVO);
//			File destDir = new File(REVIEW_IMG_REPO + "\\" + imgFileName);
			
			msg = "<script>";

			msg += "alert('DELETE COMPLETE');";

			msg += "location.href='" + request.getContextPath() + "/detail.do?rest_NO=" + rest_NO +"';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			msg = "<script>";

			msg += "alert('Try Again');";

			msg += "location.href='" + request.getContextPath() + "/detail.do?rest_NO=" + rest_NO +"';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/updateReview.do", method={RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity updateReview(DetailReviewVO detailReviewVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String msg;
		String img_FileName = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");


//		List<String> imgNameList = addImages(multipartRequest);
//		List<ImageVO> imgFileList = new ArrayList<ImageVO>();
//		if(imgNameList != null && imgNameList.size() != 0) {
//			for (String imgName : imgNameList) {
//				ImageVO imageVO = new ImageVO();
//				imageVO.setImg_FileName(imgName);
//				imgFileList.add(imageVO);
//			}
//			reviewMap.put("imgFileList", imgFileList);
//		}
		
		try {
//			detailService.updateReview(reviewMap);
//			if(imgFileList != null && imgFileList.size() != 0) {
//				for(ImageVO imageVO : imgFileList) {
//					img_FileName = imageVO.getImg_FileName();
//					File srcFile = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
//					File desDir = new File(REVIEW_IMG_REPO + "\\" + img_FileName);
//					FileUtils.moveToDirectory(srcFile, desDir, true);
//				}
//			}
			detailService.updateReview(detailReviewVO);
			
			msg = "<script>";

			msg += "alert('UPDATE COMPLETE');";

			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailReviewVO.getRest_NO() +"';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
//			if(imgFileList != null && imgFileList.size() != 0) {
//				for(ImageVO imageVO : imgFileList) {
//					img_FileName = imageVO.getImg_FileName();
//					File src = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
//					src.delete();
//				} 
//			}
			
			msg = "<script>";

			msg += "alert('UPDATE COMPLETE.')";

			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailReviewVO.getRest_NO() +"';";

			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
}
