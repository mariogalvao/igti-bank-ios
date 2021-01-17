# CardsAPI

All URIs are relative to *http://demo7257567.mockable.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMyCards**](CardsAPI.md#getmycards) | **GET** /myCards | My Cards


# **getMyCards**
```swift
    open class func getMyCards(completion: @escaping (_ data: [Card]?, _ error: Error?) -> Void)
```

My Cards

Get current user cards information

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// My Cards
CardsAPI.getMyCards() { (response, error) in
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

[**[Card]**](Card.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/xml, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

