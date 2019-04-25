package com.soma;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class poiEx1 {

	public static void main(String[] args) throws Exception {
		File myFile = new File("F:/xlsx/sample.xlsx");
		FileInputStream fis = new FileInputStream(myFile);

		XSSFWorkbook myWorkBook = new XSSFWorkbook(fis); // Finds the workbook instance for XLSX file

		XSSFSheet mySheet = myWorkBook.getSheetAt(0); // Return first sheet from the XLSX workbook

//		GetColor RGB = new GetColor();
		
		for (int i = 0; i < 270; i++) {
			XSSFRow row = mySheet.createRow(i);
			row.setHeight((short) 50);
		}

		for (int i = 0; i < 480; i++) {
			mySheet.setColumnWidth(i, 100);
		}

		FileOutputStream fos = new FileOutputStream(myFile);
		myWorkBook.write(fos);

		myWorkBook.close();
		fos.close();
		fis.close();

	}

}
