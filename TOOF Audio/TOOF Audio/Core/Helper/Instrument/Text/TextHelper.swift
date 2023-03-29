//
//  TextHelper.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.03.2023.
//

import Foundation

struct TextHelper {
    enum onboarding: String {
        case appSlogan = "APP_SLOGAN"
        case onboardingStartButton = "ONBOARDING_START_BUTTON"
    }
    
    enum auth: String {
        // Login View
        case authLoginTitle = "AUTH_LOGIN_TITLE"
        case authLoginDescription = "AUTH_LOGIN_DESCRIPTION"
        case authLetsRegister = "AUTH_LETS_REGISTER"
        case authLetsRegisterClick = "AUTH_LETS_REGISTER_CLICK"
        case authResetPassword = "AUTH_RESET_PASSWORD"
        case authLoginButton = "AUTH_LOGIN_BUTTON"
        
        // Register View
        case authRegisterTitle = "AUTH_REGISTER_TITLE"
        case authRegisterDescription = "AUTH_REGISTER_DESCRIPTION"
        case authRegisterButton = "AUTH_REGISTER_BUTTON"
        case authLetsLogin = "AUTH_LETS_LOGIN"
        case authLetsLoginClick = "AUTH_LETS_LOGIN_CLICK"
        case authPrivacyAndPolicy = "AUTH_PRIVACY_AND_POLICY"
        
        // ResetPassword View
        case authResetPasswordTitle = "AUTH_RESET_PASSWORD_TITLE"
        case authResetPasswordDescription = "AUTH_RESET_PASSWORD_DESCRIPTOIN"
        case authResetPasswordButton = "AUTH_RESET_PASSWORD_BUTTON"
        
        // Verification View
        case authSendVerificationCodeTitle = "AUTH_SEND_VERIFICATION_CODE_TITLE"
        case authSendVerificationCodeDescription = "AUTH_SEND_VERIFICATION_CODE_DESCRIPTION"
        case authVerifactionButton = "AUTH_VERIFICATION_BUTTON"
        
        // Change password view
        case authChangePasswordTitle = "AUTH_CHANGE_PASSWORD_TITLE"
        case authChangePasswordDescription = "AUTH_CHANGE_PASSWORD_DESCRIPTION"
        
        // Placeholder
        case authMailTextFieldPlaceholder = "AUTH_MAIL_TEXTFIELD_PLACEHOLDER"
        case authPasswordTextfieldPlaceholder = "AUTH_PASSWORD_TEXTFIELD_PLACEHOLDER"
        case authNameTextfieldPlaceholder = "AUTH_NAME_TEXTFIELD_PLACEHOLDER"
        case authEntryCodeTextfieldPlaceholder = "AUTH_ENTRYCODE_TEXTFIELD_PLACEHOLDER"
        case authChangePasswordTextfieldPlaceholder = "AUTH_CHANGEPASSWORD_TEXTFIELD_PLACEHOLDER"
        case authConfirmPasswordTextfieldPlaceholder = "AUTH_CONFIRMPASSOWRD_TEXTFIELD_PLACEHOLDER"
    }
    
    enum deviceFinder: String {
        // Device Finder Add view
        case deviceFinderAddDeviceTitle = "DEVICE_FINDER_ADD_DEVICE_TITLE"
        case deviceFinderAddDeviceDescription = "DEVICE_FINDER_ADD_DEVICE_DESCRIPTION"
        case deviceFinderAddDeviceButton = "DEVICE_FINDER_ADD_DEVICE_BUTTON"
        // Device Finder Connect Device view
        case deviceFinderConnectDeviceTitle = "DEVICE_FINDER_CONNECT_DEVICE_TITLE"
        case deviceFinderConnectDeviceDescription = "DEVICE_FINDER_CONNECT_DEVICE_DESCRIPTION"
        case deviceFinderConnectDeviceButton = "DEVICE_FINDER_CONNECT_DEVICE_BUTTON"
        // Device Finder Near Device view
        case deviceFinderNearDeviceTitle = "DEVICE_FINDER_NEAR_DEVICE_TITLE"
        case deviceFinderNearDeviceDescription = "DEVICE_FINDER_NEAR_DEVICE_DESCRIPTION"
        case deviceFinderNearDeviceSearch = "DEVICE_FINDER_NEAR_DEVICE_SEARCH"
        case deviceFinderNearDeviceCancel = "DEVICE_FINDER_NEAR_DEVICE_CANCEL"
        // Device Finder Search Help view
        case deviceFinderSearchHelpTitle = "DEVICE_FINDER_SEARCH_HELP_TITLE"
        case deviceFinderSearchHelpButton = "DEVICE_FINDER_SEARCH_HELP_BUTTON"
        case deviceFinderSearchHelpSectionOne = "DEVICE_FINDER_SEARCH_HELP_SECTION_ONE"
        case deviceFinderSearchHelpSectionTwo = "DEVICE_FINDER_SEARCH_HELP_SECTION_TWO"
        case deviceFinderSearchHelpSectionThree = "DEVICE_FINDER_SEARCH_HELP_SECTION_THREE"
        case deviceFinderSearchHelpSectionFour = "DEVICE_FINDER_SEARCH_HELP_SECTION_FOUR"
    }
}

