package com.chuandu.util;

import com.chuandu.constant.Constant;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLDecoder;
import java.util.*;
import java.util.List;

/**
 * 项目名称：zlzj
 * 类名称：CommonUtil
 * 类描述： 通用工具类 创建人：愤青
 * 创建时间：2015年2月16日 下午8:48:16
 * 修改人：愤青
 * 修改时间：2015年2月16日 下午8:48:16
 * 修改备注：
 */
public class CommonUtil {
    private static Logger logger = Logger.getLogger(CommonUtil.class);
    private static Properties prop;

    /**
     * @param size
     * @return 设定文件 String 返回类型
     * @Description: 获取随机数字
     */
    public static String getRandomNum(int size) {
        StringBuffer sb = new StringBuffer();
        Random r = new Random();
        int n2 = 0;
        for (int i = 0; i < size; i++) {
            n2 = r.nextInt(10);
            sb.append(n2);
        }

        return sb.toString();
    }

    /**
     * 方法描述:根据文件和key获取properties的值
     * 创建人：张郑
     * 创建时间：2015年10月12日下午3:40:24
     *
     * @param url properties名称
     * @param key
     * @return String
     * @throws IOException
     * @throws
     */
    public static String getPropertiesValue(String url, String key)
            throws IOException {
        if (null == prop) {
            prop = new Properties();
        }
        String classPath = CommonUtil.class.getClassLoader().getResource("/")
                .getPath();

        // 转码处理(主要针对空格)
        classPath = URLDecoder.decode(classPath, "utf-8");
        InputStream in = new FileInputStream(classPath + url);
        prop.load(in);
        return prop.getProperty(key).trim();
    }

    /**
     * 方法描述:拷贝文件
     * 创建人：张郑
     * 创建时间：2015年10月12日下午3:42:14
     * <p>
     * 源文件流
     *
     * @param target 目的地文件
     * @throws IOException
     * @throws
     */
    public static void copyFile(InputStream fis, File target) {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(target);
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffer)) > -1) {
                fos.write(buffer, 0, len);
            }
        } catch (FileNotFoundException e) {
            logger.error("文件没有找到", e);
        } catch (IOException e) {
            logger.error("文件读取错误", e);
        } finally {
            try {
                if (fis != null) {
                    fis.close();
                }
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
                logger.error("文件读取错误", e);
            }
        }
    }

    /**
     * 方法描述:创建用户编号
     * 创建人：pengkejie
     * 创建时间：2015-10-14下午6:06:43
     *
     * @param code 传入从数据库中查询出来的最后一个创建的商家编号,传入格式为015100900001,总共12位数字
     * @return 返回格式为015100900001的一串字符串
     * @throws
     */

    public static String createCode(String typeCode, String code) {
        int length = code.length();
        if (length < 12) {
            return null;
        }
        String date = DateUtil.format(new Date(), "yyMMdd");// 获取当前日期
        String oldDateString = code.substring(1, 7);// 获取传入编号中的时间段
        String oldOrderString = code.substring(1);// 获取传入编号的排序段

        Long dateLong = Long.valueOf(date);
        Long oldDateLong = Long.valueOf(oldDateString);
        Long oldOrderLong = Long.valueOf(oldOrderString);
        Long orderLong = Long.valueOf(date + "00001");

        if (dateLong.longValue() == oldDateLong.longValue()) {// 做判断,如果是当前日期就将编号加一
            orderLong = oldOrderLong + 1;
        }
        code = typeCode + orderLong.toString();
        return code;

    }

    /**
     * 方法描述:图片文件上传
     * 创建人：刘玉林
     * 创建时间：2015年10月16日下午3:33:51
     *
     * @param request
     * @param diskPath 目标路径
     * @return 保存的文件名
     * @throws IOException
     * @throws
     */
    @SuppressWarnings({"rawtypes"})
    public static String uploadImage(HttpServletRequest request, String diskPath) {
        System.out.println(request.getParameterNames());
        // 获取本地文件路径
        String fileName = UUID.randomUUID().toString();
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 中文乱码
        upload.setHeaderEncoding("utf-8");
        File file = null;
        try {
            file = new File(diskPath, fileName + ".jpg");
            file.getParentFile().mkdirs();
            file.createNewFile();
            List<FileItem> items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    CommonUtil.copyFile(item.getInputStream(), file);
                }
            }
        } catch (FileUploadException e) {
            logger.error("文件目录没有找到", e);
        } catch (IOException e) {
            logger.error("文件读取异常", e);
        }
        return file.getName();
    }

    public static void deleteFiles(File file) {
        if (!file.isFile()) {
            if (file.listFiles() != null) {
                for (File f : file.listFiles()) {
                    deleteFiles(f);
                    f.delete();
                }
            }
        }
        file.delete();
    }

    public static boolean checkTime(Date oldDate, Date newDate) {
        boolean flag = false;
        //时间差（毫秒）
        long diff = newDate.getTime() - oldDate.getTime();
        try {

            String day = getPropertiesValue("timeConfig.properties", "loginTime");

            int days = Integer.parseInt(day);
            //30天的毫秒数
            long farmat = days * 24 * 60 * 60 * 1000;
            if (diff <= farmat) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (IOException e) {
            logger.error("文件读取异常", e);
        } catch (Exception e) {
            logger.error("数据转换异常", e);
        }
        return flag;
    }

    /**
     * 方法描述:
     * 创建人：pengkejie
     * 创建时间：2015-10-28下午4:13:20
     *
     * @return
     * @throws
     */
    public static String getToken() {
        String token = UUID.randomUUID().toString().replaceAll("-", "");
        return token;
    }

    public static String getFileNameExtendName(String fileName) {
        return fileName.substring(fileName.indexOf('.'), fileName.length());
    }

    public static String getImageUrlRealFileName(String fileUrl) {
        return fileUrl.substring(fileUrl.lastIndexOf('/') + 1, fileUrl.length());
    }

    public static int calculatePage(int total, int limit) {
        return total / limit + (total % limit != 0 ? 1 : 0);
    }

    public static String uuid() {
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replace("-", "");
        return uuid;
    }

    public static String fetchExtendName(String filename) {
        return filename.substring(filename.lastIndexOf('.'), filename.length());
    }

    public static String copySingleFile(String id, MultipartFile file, String properties) throws IOException {
        String picName = new Date().getTime() + CommonUtil.fetchExtendName(file.getOriginalFilename());
        String prefix = CommonUtil.getPropertiesValue(Constant.PROPERTIES_NAME, properties);
        String fileDocument = CommonUtil.getPropertiesValue(Constant.PROPERTIES_NAME, Constant.BASE_PATH) + prefix + id;
        File doc = new File(fileDocument);
        if (!doc.exists()) {
            doc.mkdirs();
        }
        String pics = prefix + id + "/" + picName;
        // 文件保存路径
        String filePath = fileDocument + "/" + picName;
        file.transferTo(new File(filePath));
        return pics;
    }

    public static void delteSingleFile(String url) throws IOException {
        String prefix = CommonUtil.getPropertiesValue(Constant.PROPERTIES_NAME, Constant.BASE_PATH);
        File doc = new File(prefix + url);
        if (doc.exists() && doc.isFile()) {
            doc.delete();
        } else if (doc.exists() && doc.isDirectory()) {
            File[] files = doc.listFiles();
            for (File file : files) {
                file.delete();
            }
            doc.delete();
        }
    }

    public static String handlerExcelDouble(String substring) {

        if (substring.indexOf(".") != -1 && "00".equals(substring.substring(substring.indexOf(".") + 1, substring.length()))) {
            return substring.substring(0, substring.indexOf("."));
        }
        return substring;
    }

    //图片转化成base64字符串
    public static String getImageStr() {//将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        String imgFile = "d://test.jpg";//待处理的图片
        InputStream in = null;
        byte[] data = null;
        //读取图片字节数组
        try {
            in = new FileInputStream(imgFile);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);//返回Base64编码过的字节数组字符串
    }

    //base64字符串转化成图片
    public static byte[] generateImage(String imgStr) throws IOException {   //对字节数组字符串进行Base64解码并生成图片
        //图像数据为空
        if (imgStr == null){
            return null;
        }
        String target = imgStr;
        if(imgStr.indexOf(";base64,") != -1){
            target =imgStr.split(";base64,")[1];
        }
        BASE64Decoder decoder = new BASE64Decoder();
        //Base64解码
        byte[] b = decoder.decodeBuffer(target);
        for (int i = 0; i < b.length; ++i) {
            if (b[i] < 0) {//调整异常数据
                b[i] += 256;
            }
        }
        return b;
    }

    /**
     * @param inputStream 图片输入流
     * @return 读取到的缓存图像
     * @throws IOException 路径错误或者不存在该文件时抛出IO异常
     */
    public static BufferedImage getBufferedImage(InputStream inputStream)
            throws IOException {
        return ImageIO.read(inputStream);
    }

    /**
     * @param savedImg 待保存的图像
     * @param saveDir  保存的目录
     * @param format   文件格式：jpg、png或者bmp
     * @return
     */
    public static boolean saveImage(BufferedImage savedImg, String saveDir,String format) {
        boolean flag = false;

        // 先检查保存的图片格式是否正确
        String[] legalFormats = {"jpg", "JPG", "png", "PNG", "bmp", "BMP"};
        int i = 0;
        for (i = 0; i < legalFormats.length; i++) {
            if (format.equals(legalFormats[i])) {
                break;
            }
        }
        if (i == legalFormats.length) { // 图片格式不支持
            System.out.println("不是保存所支持的图片格式!");
            return false;
        }

        File file = new File(saveDir);
        try {
            flag = ImageIO.write(savedImg, format, file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return flag;
    }

    /**
     * 待合并的两张图必须满足这样的前提，如果水平方向合并，则高度必须相等；如果是垂直方向合并，宽度必须相等。
     * mergeImage方法不做判断，自己判断。
     *
     * @param img1         待合并的第一张图
     * @param img2         带合并的第二张图
     * @param isHorizontal 为true时表示水平方向合并，为false时表示垂直方向合并
     * @return 返回合并后的BufferedImage对象
     * @throws IOException
     */
    public static BufferedImage mergeImage(BufferedImage img1, BufferedImage img2, boolean isHorizontal) throws IOException {
        int w1 = img1.getWidth();
        int h1 = img1.getHeight();
        int w2 = img2.getWidth();
        int h2 = img2.getHeight();

        // 从图片中读取RGB
        int[] ImageArrayOne = new int[w1 * h1];
        ImageArrayOne = img1.getRGB(0, 0, w1, h1, ImageArrayOne, 0, w1); // 逐行扫描图像中各个像素的RGB到数组中
        int[] ImageArrayTwo = new int[w2 * h2];
        ImageArrayTwo = img2.getRGB(0, 0, w2, h2, ImageArrayTwo, 0, w2);

        // 生成新图片
        BufferedImage DestImage = null;
        if (isHorizontal) { // 水平方向合并
            DestImage = new BufferedImage(w1 + w2, h1, BufferedImage.TYPE_INT_RGB);
            DestImage.setRGB(0, 0, w1, h1, ImageArrayOne, 0, w1); // 设置上半部分或左半部分的RGB
            DestImage.setRGB(w1, 0, w2, h2, ImageArrayTwo, 0, w2);
        } else { // 垂直方向合并
            DestImage = new BufferedImage(w1, h1 + h2 + 30,BufferedImage.TYPE_INT_RGB);
            DestImage.setRGB(0, 0, w1, h1, ImageArrayOne, 0, w1); // 设置上半部分或左半部分的RGB
            //设置两张图片的间隔20
            Graphics g = DestImage.getGraphics();
            g.setColor(Color.white);
            g.fillRect(0,h1,w1,h1+30);
            g.dispose();
            DestImage.setRGB(0, h1+30, w2, h2, ImageArrayTwo, 0, w2); // 设置下半部分的RGB
        }

        return DestImage;
    }
}