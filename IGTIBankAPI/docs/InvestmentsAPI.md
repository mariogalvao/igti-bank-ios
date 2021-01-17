# InvestmentsAPI

All URIs are relative to *http://demo7257567.mockable.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInvestments**](InvestmentsAPI.md#getinvestments) | **GET** /investments | Investments
[**getMyInvestments**](InvestmentsAPI.md#getmyinvestments) | **GET** /myInvestments | My Investments


# **getInvestments**
```swift
    open class func getInvestments(completion: @escaping (_ data: [Investment]?, _ error: Error?) -> Void)
```

Investments

Get current investments available

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Investments
InvestmentsAPI.getInvestments() { (response, error) in
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

[**[Investment]**](Investment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/xml, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyInvestments**
```swift
    open class func getMyInvestments(completion: @escaping (_ data: MyInvestments?, _ error: Error?) -> Void)
```

My Investments

Get current user investment information

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// My Investments
InvestmentsAPI.getMyInvestments() { (response, error) in
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

[**MyInvestments**](MyInvestments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/xml, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

