package emall.util.encryption;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * author:taurin
 * time:2015/3/20
 * function:实现对密码加密功能，注意，只能加密，不能解密
 */
public class EncryptionByMD5 {
    /*
    * 加密字符数组
    * */
    private final static String[] mappingArray = {"0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    /**
     * function:使用MD5加密算法
     *
     * @param password 原始密码
     * @return string 加密后的密码
     * @throws NoSuchAlgorithmException
     */
    public String encodeByMD5(String password) throws NoSuchAlgorithmException {
        if (password == null) {
            return null;
        }
        MessageDigest md = MessageDigest.getInstance("MD5");  //使用MD5算法进行加密,输出固定长度哈希值
        byte[] byteString = md.digest(password.getBytes());   //转换password为byte数组，并以MD5算法更新，完成计算摘要

        String encodePassword = byteArrayToString(byteString);


        return encodePassword.toUpperCase();
    }

    /**
     * function:将byte数组转为字符串
     *
     * @param byteString 要转换的byte数组
     * @return string 转换后的字符串
     */
    private String byteArrayToString(byte[] byteString) {
        StringBuilder stringBuilder = new StringBuilder();

        for (byte aByteString : byteString) {
            stringBuilder.append(byteToString(aByteString));
        }
        return stringBuilder.toString();
    }

    /**
     * function:将一个byte变量转换为加密字符数组中的一个或几个元素组成的字符串
     *
     * @param b 一个byte变量
     * @return 一个或几个元素构成的字符串
     */
    private String byteToString(byte b) {
        int n = b;
        if (n < 0) {
            n += 255;
        }
        int d1 = n / 16;              //取得整数位，设置为加密数组的下标
        int d2 = n % 16;              //取得余数位，设置为加密数组的下标

        return mappingArray[d1] + mappingArray[d2];
    }
}
