package com.adminlte.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.IteratorUtils;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel读写工具类
 * 
 * @author sun.kai 2016年8月21日
 */
public class POIUtil {
	private static Logger logger = Logger.getLogger(POIUtil.class);
	private final static String xls = "xls";
	private final static String xlsx = "xlsx";

	/**
	 * 读入excel文件，解析后返回
	 * 
	 * @param file
	 * @throws IOException
	 */
	public static List<Object[]> readExcel(InputStream fileis, String fileName) throws IOException {
		// 检查文件
		checkFile(fileis, fileName);
		// 获得Workbook工作薄对象
		Workbook workbook = getWorkBook(fileis, fileName);
		// 创建返回对象，把每行中的值作为一个数组，所有行作为一个集合返回
		List<Object[]> list = new ArrayList<Object[]>();
		if (workbook != null) {
			for (int sheetNum = 0; sheetNum < workbook.getNumberOfSheets(); sheetNum++) {
				// 获得当前sheet工作表
				Sheet sheet = workbook.getSheetAt(sheetNum);
				if (sheet == null) {
					continue;
				}
				// 获得当前sheet的开始行
				int firstRowNum = sheet.getFirstRowNum();
				// 获得当前sheet的结束行
				int lastRowNum = sheet.getLastRowNum();
				// 循环除了第一行的所有行
				for (int rowNum = firstRowNum + 1; rowNum <= lastRowNum; rowNum++) {
					// 获得当前行
					Row row = sheet.getRow(rowNum);
					if (row == null) {
						continue;
					}
					// 获得当前行的开始列
					int firstCellNum = row.getFirstCellNum();
					// 获得当前行的列数
					int lastCellNum = row.getPhysicalNumberOfCells();
					String[] cells = new String[row.getPhysicalNumberOfCells()];
					// 循环当前行
					for (int cellNum = firstCellNum; cellNum < lastCellNum; cellNum++) {
						Cell cell = row.getCell(cellNum);
						cells[cellNum] = getCellValue(cell);
					}
					list.add(cells);
				}
			}
			workbook.close();
		}
		return list;
	}

	/**
	 * 读入excel文件，解析后返回
	 * 
	 * @param file
	 * @throws IOException
	 */
	public static List<Map<String, Object>> readExcelToMap(InputStream fileis, String fileName,
			Map<String, Object> objectMap) throws IOException {
		// 检查文件
		checkFile(fileis, fileName);
		// 获得Workbook工作薄对象
		Workbook workbook = getWorkBook(fileis, fileName);
		// 创建返回对象，把每行中的值作为一个数组，所有行作为一个集合返回
		List<Object[]> list = new ArrayList<Object[]>();
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		if (workbook != null) {
			for (int sheetNum = 0; sheetNum < workbook.getNumberOfSheets(); sheetNum++) {
				// 获得当前sheet工作表
				Sheet sheet = workbook.getSheetAt(sheetNum);
				if (sheet == null) {
					continue;
				}
				// 获得当前sheet的开始行
				int firstRowNum = sheet.getFirstRowNum();
				// 获得当前sheet的结束行
				int lastRowNum = sheet.getLastRowNum();
				// 循环除了第一行的所有行
				for (int rowNum = firstRowNum + 1; rowNum <= lastRowNum; rowNum++) {
					// 获得当前行
					Row row = sheet.getRow(rowNum);
					if (row == null) {
						continue;
					}
					// 获得当前行的开始列
					int firstCellNum = row.getFirstCellNum();
					// 获得当前行的列数
					int lastCellNum = row.getPhysicalNumberOfCells();
					String[] cells = new String[row.getPhysicalNumberOfCells()];
					IDUtil.get32UUID();

					List<String> keyList = IteratorUtils.toList(objectMap.keySet().iterator());
					Map<String, Object> dataMap = new HashMap<String, Object>();
					// 循环当前行
					for (int cellNum = firstCellNum; cellNum < lastCellNum; cellNum++) {
						Cell cell = row.getCell(cellNum);
						cells[cellNum] = getCellValue(cell);
						dataMap.put(keyList.get(cellNum), getCellValue(cell));
					}
					mapList.add(dataMap);
					list.add(cells);
				}
			}
			workbook.close();
		}
		return mapList;
	}

	/**
	 * 读入excel文件，解析后返回
	 * 
	 * @param file
	 * @throws IOException
	 */
	public static void readMapToExcel(OutputStream fileos, LinkedHashMap<String,Object> paramMap, List<Map<String, Object>> objectList)
			throws IOException {
		try {
			List<String> paramList = IteratorUtils.toList(paramMap.keySet().iterator());
			// 第一步，创建一个webbook，对应一个Excel文件
			HSSFWorkbook wb = new HSSFWorkbook();
			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = wb.createSheet("学生表一");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow((int) 0);
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
			HSSFCell cell = null;
			
			for (int i = 0; i < paramList.size(); i++) {
				cell = row.createCell((short) i);
				cell.setCellValue(paramMap.get(paramList.get(i).toString()).toString());
				cell.setCellStyle(style);
			}

			// 第五步，写入实体数据 实际应用中这些数据从数据库得到，
			for (int i = 0; i < objectList.size(); i++) {
				row = sheet.createRow(i + 1);
				Map<String, Object> objectMap = (Map<String, Object>)objectList.get(i);
				// 第四步，创建单元格，并设置值
				for (int j = 0; j < paramList.size(); j++) {
					row.createCell((short) j).setCellValue(objectMap.get(paramList.get(i).toString()).toString());
				}
			}
			// 第六步，将文件存到指定位置
			wb.write(fileos);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void checkFile(InputStream fileis, String fileName) throws IOException {
		// 判断文件是否存在
		if (null == fileis) {
			logger.error("文件不存在！");
			throw new FileNotFoundException("文件不存在！");
		}
		// 判断文件是否是excel文件
		if (!fileName.endsWith(xls) && !fileName.endsWith(xlsx)) {
			logger.error(fileName + "不是excel文件");
			throw new IOException(fileName + "不是excel文件");
		}
	}

	public static Workbook getWorkBook(InputStream fileis, String fileName) {
		// 创建Workbook工作薄对象，表示整个excel
		Workbook workbook = null;
		try {
			// 根据文件后缀名不同(xls和xlsx)获得不同的Workbook实现类对象
			if (fileName.endsWith(xls)) {
				// 2003
				workbook = new HSSFWorkbook(fileis);
			} else if (fileName.endsWith(xlsx)) {
				// 2007
				workbook = new XSSFWorkbook(fileis);
			}
		} catch (IOException e) {
			logger.info(e.getMessage());
		}
		return workbook;
	}

	public static String getCellValue(Cell cell) {
		String cellValue = "";
		if (cell == null) {
			return cellValue;
		}
		// 把数字当成String来读，避免出现1读成1.0的情况
		if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
			cell.setCellType(Cell.CELL_TYPE_STRING);
		}
		// 判断数据的类型
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_NUMERIC: // 数字
			cellValue = String.valueOf(cell.getNumericCellValue());
			break;
		case Cell.CELL_TYPE_STRING: // 字符串
			cellValue = String.valueOf(cell.getStringCellValue());
			break;
		case Cell.CELL_TYPE_BOOLEAN: // Boolean
			cellValue = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_FORMULA: // 公式
			cellValue = String.valueOf(cell.getCellFormula());
			break;
		case Cell.CELL_TYPE_BLANK: // 空值
			cellValue = "";
			break;
		case Cell.CELL_TYPE_ERROR: // 故障
			cellValue = "非法字符";
			break;
		default:
			cellValue = "未知类型";
			break;
		}
		return cellValue;
	}

	public static void main(String[] args) {
		try {
//			Map<String, Object> testMap = new HashMap<String, Object>();
//			testMap.put("ee", "");
//			testMap.put("xx", "");
//			testMap.put("rr", "");
//			testMap.put("aa", "");
//			POIUtil.readExcelToMap(FileUtils.openInputStream(new File("E:\\test.xlsx")), "test.xlsx", testMap);
			
			
			LinkedHashMap<String,Object> paramMap= new LinkedHashMap<String,Object>();
			paramMap.put("paramMap1", "测试1");
			paramMap.put("paramMap2", "测试2");
			Map<String, Object> Lmap1 = new HashMap<String, Object>();
			Lmap1.put("paramMap1","test11");
			Lmap1.put("paramMap2","test12");
			Map<String, Object> Lmap2 = new HashMap<String, Object>();
			Lmap2.put("paramMap1","test21");
			Lmap2.put("paramMap2","test22");
			
			
			List<Map<String, Object>> objectList= new ArrayList<Map<String, Object>>();
			objectList.add(Lmap1);
			objectList.add(Lmap1);
			
			FileOutputStream fout = new FileOutputStream("E:/test1.xls");
			
			POIUtil.readMapToExcel(fout, paramMap, objectList);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}