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
    
    enum main: String {
        case mainBrowseTitle = "MAIN_BROWSE_TITLE"
        case mainBrowseMusicService = "MAIN_BROwSE_MUSIC_SERVICE"
        case mainBrowseMyLibrary = "MAIN_BROWSE_MY_LIBRARY"
        case mainBrowseMyMusic = "MAIN_BROWSE_MY_MUSICS"
        
        case mainDeviceTitle = "MAIN_DEVICE_TITLE"
        case mainDevicePlaying = "MAIN_DEVICE_PLAYING"
        case mainDeviceNotPlaying = "MAIN_DEVICE_NOT_PLAYING"
        case mainDeviceAddNewdevice = "MAIN_DEVICE_ADD_NEW_DEVICE"
        case mainDeviceSettingsRenameDevice = "MAIN_DEVICE_SETTINGS_RENAME_DEVICE"
        case mainDeviceSettingsInfoDevice = "MAIN_DEVICE_SETTINGS_INFO_DEVICE"
        case mainDeviceSettingsAlarm = "MAIN_DEVICE_SETTINGS_ALARM"
        case mainDeviceSettingsEQ = "MAIN_DEVICE_SETTINGS_EQ"
        case mainDeviceSettingsCustomContent = "MAIN_DEVICE_SETTINGS_CUSTOM_CONTENT"
        case mainDeviceSettingsRenameRenamed = "MAIN_DEVICE_SETTINGS_RENAME_RENAMED"
        case mainDeviceSettingsRenameButton = "MAIN_DEVICE_SETTINGS_RENAME_BUTTON"
        case mainDeviceSettingsInfoDeviceEthernetStatus = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_ETHERNET_STATUS"
        case mainDeviceSettingsInfoDeviceEthernetStatusIp = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_ETHERNET_STATUS_IP"
        case mainDeviceSettingsInfoDeviceEthernetStatusMac = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_ETHERNET_STATUS_MAC"
        case mainDeviceSettingsInfoDeviceHotspotStatus = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS"
        case mainDeviceSettingsInfoDeviceHotspotStatusSsid = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_SSID"
        case mainDeviceSettingsInfoDeviceHotspotStatusHotspotOpen = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_HOTSPOT_OPEN"
        case mainDeviceSettingsInfoDeviceHotspotStatusOtherStatus = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_OTHER_STATUS"
        case mainDeviceSettingsInfoDeviceHotspotStatusSpearkerName = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_SPEARKER_NAME"
        case mainDeviceSettingsInfoDeviceHotspotStatusFirmwareVersion = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_FIRMWARE_VERSION"
        case mainDeviceSettingsInfoDeviceHotspotStatusBeenDate = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_BEEN_DATE"
        case mainDeviceSettingsInfoDeviceHotspotStatusUuid = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_UUID"
        case mainDeviceSettingsInfoDeviceHotspotStatusDeviceLanguage = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_DEVICE_LANGUAGE"
        case mainDeviceSettingsInfoDeviceHotspotStatusResetDevice = "MAIN_DEVICE_SETTINGS_INFO_DEVICE_HOTSPOT_STATUS_RESET_DEVICE"
        
        case mainSearchSearchBar = "MAIN_SEARCH_SEARCHBAR"
        case mainSearchArtists = "MAIN_SEARCH_ARTISTS"
        case mainSearchSongs = "MAIN_SEARCH_SONGS"
        case mainSearchAlbums = "MAIN_SEARCH_ALBUMS"
        case mainSearchPlaylist = "MAIN_SEARCH_PLAYLIST"
        
        case mainSettingsTitle = "MAIN_SETTINGS_TITLE"
        case mainSettingsAccTitle = "MAIN_SETTINGS_ACC_TITLE"
        case mainSettingsAccButton = "MAIN_SETTINGS_ACC_BUTTON"
        case mainSettingsSubTitle = "MAIN_SETTINGS_SUB_TITLE"
        case mainSettingsSubDescription = "MAIN_SETTINGS_SUB_DESCRIPTION"
        case mainSettingsSubMailTitle = "MAIN_SETTINGS_SUB_MAIL_TITLE"
        case mainSettingsSubMailExample = "MAIN_SETTINGS_SUB_MAIL_EXAMPLE"
        case mainSettingsSubPhoneTitle = "MAIN_SETTINGS_SUB_PHONE_TITLE"
        case mainSettingsSubPhoneExample = "MAIN_SETTINGS_SUB_PHONE_EXAMPLE"
        case mainSettingsLogout = "MAIN_SETTINGS_LOGOUT"
        
        case mainDeviceSettingsAlarmNotyetAlarm = "MAIN_DEVICE_SETTINGS_ALARM_NOTYET_ALARM"
        case mainDeviceSettingsAlarmAddAlarm = "MAIN_DEVICE_SETTINGS_ALARM_ADD_ALARM"
        case mainDeviceSettingsEqTrable = "MAIN_DEVICE_SETTINGS_EQ_TRABLE"
        case mainDeviceSettingsEqBass = "MAIN_DEVICE_SETTINGS_EQ_BASS"
        case mainDeviceSettingsCustomContentSpecify = "MAIN_DEVICE_SETTINGS_CUSTOM_CONTENT_SPECIFY"
        case mainDeviceSettingsCustomContentDescription = "MAIN_DEVICE_SETTINGS_CUSTOM_CONTENT_DESCRIPTION"
        case mainDeviceSettingsCustomContentButton = "MAIN_DEVICE_SETTINGS_CUSTOM_CONTENT_BUTTON"
        case mainDeviceSettingsCustomContentSetContent = "MAIN_DEVICE_SETTINGS_CUSTOM_CONTENT_SET_CONTENT"
    }
}
