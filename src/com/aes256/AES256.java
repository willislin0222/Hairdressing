package com.aes256;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import it.sauronsoftware.base64.Base64;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.Security;

/** 
 * java实现AES256加密解密 
 * 依赖说明： 
 * bcprov-jdk15-133.jar：PKCS7Padding 
 * javabase64-1.3.1.jar：base64 
 * local_policy.jar 和 US_export_policy.jar需添加到%JAVE_HOME%\jre\lib\security中（lib中版本适合jdk1.8） 
 */  

public class AES256 {

	/**
     * AES加密字符串
     * 
     * @param content
     *            需要被加密的字符串
     * @param password
     *            加密需要的密码
     * @return 密文
     */
	 public static byte[] encrypt(String content, String password) {  
	        try {  
	            //"AES"：請求的密鑰算法的標準名稱
	            KeyGenerator kgen = KeyGenerator.getInstance("AES");  
	            //256：密鑰生成參數；securerandom：密鑰生成器的隨機源
	            SecureRandom securerandom = new SecureRandom(tohash256Deal(password));  
	            kgen.init(256, securerandom);  
	            //生成秘密（對稱）密鑰  
	            SecretKey secretKey = kgen.generateKey();  
	            //返回基本編碼格式的密鑰
	            byte[] enCodeFormat = secretKey.getEncoded();  
	            //根據給定的字節數組構造一個密鑰。 enCodeFormat：密鑰內容；"AES"：與給定的密鑰內容相關聯的密鑰算法的名稱 
	            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");  
	            //將提供程序添加到下一個可用位置  
	            Security.addProvider(new BouncyCastleProvider());  
	            //創建一個實現指定轉換的 Cipher對象，該轉換由指定的提供程序提供。
	            //"AES/ECB/PKCS7Padding"：轉換的名稱；"BC"：提供程序的名稱
	            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");  
	  
	            cipher.init(Cipher.ENCRYPT_MODE, key);  
	            byte[] byteContent = content.getBytes("utf-8");  
	            byte[] cryptograph = cipher.doFinal(byteContent);  
	            return Base64.encode(cryptograph);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        return null;  
	    }  
		 
	 public static String decrypt(byte[] cryptograph, String password) {  
	        try {  
	            KeyGenerator kgen = KeyGenerator.getInstance("AES");  
	            SecureRandom securerandom = new SecureRandom(tohash256Deal(password));  
	            kgen.init(256, securerandom);  
	            SecretKey secretKey = kgen.generateKey();  
	            byte[] enCodeFormat = secretKey.getEncoded();  
	            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");  
	            Security.addProvider(new BouncyCastleProvider());  
	            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");  
	  
	            cipher.init(Cipher.DECRYPT_MODE, key);  
	            byte[] content = cipher.doFinal(Base64.decode(cryptograph));  
	            return new String(content);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        return null;  
	    }  
	 
	 public static String parseByte2HexStr(byte buf[]) {  
	        StringBuffer sb = new StringBuffer();  
	        for (int i = 0; i < buf.length; i++) {  
	            String hex = Integer.toHexString(buf[i] & 0xFF);  
	            if (hex.length() == 1) {  
	                hex = '0' + hex;  
	            }  
	            sb.append(hex.toUpperCase());  
	        }  
	        return sb.toString();  
	    }  
	 
	 public static byte[] tohash256Deal(String datastr) {  
	        try {  
	            MessageDigest digester=MessageDigest.getInstance("SHA-256");  
	            digester.update(datastr.getBytes());  
	            byte[] hex=digester.digest();  
	            return hex;   
	        } catch (NoSuchAlgorithmException e) {  
	            throw new RuntimeException(e.getMessage());    
	        }  
	    }  
    
    
		 
    public static void main(String[] args) {
    	String content = "vicky";  
        String password = "zdtyukd";  
        System.out.println("明文：" + content);  
        System.out.println("key：" + password);  
          
        byte[] encryptResult = AES256.encrypt(content, password);  
        System.out.println("密文：" + AES256.parseByte2HexStr(encryptResult));  
          
        String decryptResult = AES256.decrypt(encryptResult, password);  
        System.out.println("解密：" + decryptResult);          
    }
}
