# AccountAPI

All URIs are relative to *http://demo7257567.mockable.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMyBalance**](AccountAPI.md#getmybalance) | **GET** /myBalance | My Balance
[**getMyInfo**](AccountAPI.md#getmyinfo) | **GET** /myInfo | My Profile and Account Information


# **getMyBalance**
```swift
    open class func getMyBalance(completion: @escaping (_ data: Balance?, _ error: Error?) -> Void)
```

My Balance

Get current user balance

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// My Balance
AccountAPI.getMyBalance() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Balance**](Balance.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/xml, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyInfo**
```swift
    open class func getMyInfo(completion: @escaping (_ data: MyInfo?, _ error: Error?) -> Void)
```

My Profile and Account Information

Get current user information

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// My Profile and Account Information
AccountAPI.getMyInfo() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MyInfo**](MyInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/xml, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

