package com.spring.project2_test.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class FileDownloadController {
	private static final String IMAGE_REPO = "C:\\board\\article_image";
	
	
	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
							
			                 HttpServletResponse response)throws Exception {
		System.out.println(fileName);
		OutputStream out = response.getOutputStream();
		String downFile = IMAGE_REPO + "\\"+ fileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
