//
//  UrlConstants.swift
//  MyNews App
//
//  Created by sibaprasad on 23/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
class UrlConstants {
    
    public static let BASE_URL                  =  "http://www.veergurudev.com/App/API/"
    public static let API_LOGIN                 =   BASE_URL+"login.php?";
    public static let API_REGISTER              =   BASE_URL+"register_user.php?";
    public static let API_NEWS                  =   BASE_URL+"head_news.php?uid=";
    public static let API_QUESTIONS             =   BASE_URL+"get_all_questions.php?state_id=";
    public static let API_FORGOT_PWD            =   BASE_URL+"forgot_password.php?email=";
    public static let API_LIKE                  =   BASE_URL+"like_unlike_head_news.php?nid=";
    public static let API_HALLABOL              =   BASE_URL+"hallabol.php?";
    public static let API_INSERT_QST            =   BASE_URL+"insert_questions.php";
    public static let API_SEND_COMMENT          =   BASE_URL+"hallabol_insert_comment.php?";
    public static let API_INSERT_HALLABOL       =  BASE_URL+"hallabol_insert_post.php?";
    public static let API_GET_HALLABOL_COMMENT  =  BASE_URL+"hallabol_get.php?id=";
    public static let API_SEND_HALLABOL_COMMENT =  BASE_URL+"hallabol_insert_comment.php?";
    public static let API_GET_USER_DETAILS      =  BASE_URL+"user_details.php?uid=";

}
