using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace ShopGiayHHL.Library
{
    public static class XString
    {
        public static String str_slug(this String s)
        {
            String[][] symbols =
            {
                new string [] {"/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi","a"},
                new string []  {"/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi","e" },
                new string []   {"/i|í|ì|ỉ|ĩ|ị/gi","i"},
                new string []   {"/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi","o"},
                new string [] {"/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi","u"},
                new string []   {"/ý|ỳ|ỷ|ỹ|ỵ/gi","y"},
                new string [] {"[\\s'\";, ]","-"}
            };
            s = s.ToLower();
            foreach (var ss in symbols)
            {
                s = Regex.Replace(s, ss[0], ss[1]);
            }
            return s;
        }

        public static String ToMD5( this string s)
        {
            var bytes = Encoding.UTF8.GetBytes(s);
            var hash = MD5.Create().ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }    
    }
}