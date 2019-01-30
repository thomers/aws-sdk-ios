//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSS3Resources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSS3Resources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSS3Resources

+ (instancetype)sharedInstance {
    static AWSS3Resources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSS3Resources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2006-03-01\",\
    \"checksumFormat\":\"md5\",\
    \"endpointPrefix\":\"s3\",\
    \"globalEndpoint\":\"s3.amazonaws.com\",\
    \"protocol\":\"rest-xml\",\
    \"serviceAbbreviation\":\"Amazon S3\",\
    \"serviceFullName\":\"Amazon Simple Storage Service\",\
    \"serviceId\":\"S3\",\
    \"signatureVersion\":\"s3\",\
    \"uid\":\"s3-2006-03-01\"\
  },\
  \"operations\":{\
    \"AbortMultipartUpload\":{\
      \"name\":\"AbortMultipartUpload\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"AbortMultipartUploadRequest\"},\
      \"output\":{\"shape\":\"AbortMultipartUploadOutput\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchUpload\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadAbort.html\",\
      \"documentation\":\"<p>Aborts a multipart upload.</p> <p>To verify that all parts have been removed, so you don't get charged for the part storage, you should call the List Parts operation and ensure the parts list is empty.</p>\"\
    },\
    \"CompleteMultipartUpload\":{\
      \"name\":\"CompleteMultipartUpload\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"CompleteMultipartUploadRequest\"},\
      \"output\":{\"shape\":\"CompleteMultipartUploadOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadComplete.html\",\
      \"documentation\":\"<p>Completes a multipart upload by assembling previously uploaded parts.</p>\"\
    },\
    \"CopyObject\":{\
      \"name\":\"CopyObject\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"CopyObjectRequest\"},\
      \"output\":{\"shape\":\"CopyObjectOutput\"},\
      \"errors\":[\
        {\"shape\":\"ObjectNotInActiveTierError\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectCOPY.html\",\
      \"documentation\":\"<p>Creates a copy of an object that is already stored in Amazon S3.</p>\",\
      \"alias\":\"PutObjectCopy\"\
    },\
    \"CreateBucket\":{\
      \"name\":\"CreateBucket\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}\"\
      },\
      \"input\":{\"shape\":\"CreateBucketRequest\"},\
      \"output\":{\"shape\":\"CreateBucketOutput\"},\
      \"errors\":[\
        {\"shape\":\"BucketAlreadyExists\"},\
        {\"shape\":\"BucketAlreadyOwnedByYou\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUT.html\",\
      \"documentation\":\"<p>Creates a new bucket.</p>\",\
      \"alias\":\"PutBucket\"\
    },\
    \"CreateMultipartUpload\":{\
      \"name\":\"CreateMultipartUpload\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/{Bucket}/{Key+}?uploads\"\
      },\
      \"input\":{\"shape\":\"CreateMultipartUploadRequest\"},\
      \"output\":{\"shape\":\"CreateMultipartUploadOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadInitiate.html\",\
      \"documentation\":\"<p>Initiates a multipart upload and returns an upload ID.</p> <p> <b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>\",\
      \"alias\":\"InitiateMultipartUpload\"\
    },\
    \"DeleteBucket\":{\
      \"name\":\"DeleteBucket\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketDELETE.html\",\
      \"documentation\":\"<p>Deletes the bucket. All objects (including all object versions and Delete Markers) in the bucket must be deleted before the bucket itself can be deleted.</p>\"\
    },\
    \"DeleteBucketAnalyticsConfiguration\":{\
      \"name\":\"DeleteBucketAnalyticsConfiguration\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?analytics\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketAnalyticsConfigurationRequest\"},\
      \"documentation\":\"<p>Deletes an analytics configuration for the bucket (specified by the analytics configuration ID).</p>\"\
    },\
    \"DeleteBucketCors\":{\
      \"name\":\"DeleteBucketCors\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?cors\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketCorsRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketDELETEcors.html\",\
      \"documentation\":\"<p>Deletes the cors configuration information set for the bucket.</p>\"\
    },\
    \"DeleteBucketEncryption\":{\
      \"name\":\"DeleteBucketEncryption\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?encryption\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketEncryptionRequest\"},\
      \"documentation\":\"<p>Deletes the server-side encryption configuration from the bucket.</p>\"\
    },\
    \"DeleteBucketInventoryConfiguration\":{\
      \"name\":\"DeleteBucketInventoryConfiguration\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?inventory\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketInventoryConfigurationRequest\"},\
      \"documentation\":\"<p>Deletes an inventory configuration (identified by the inventory ID) from the bucket.</p>\"\
    },\
    \"DeleteBucketLifecycle\":{\
      \"name\":\"DeleteBucketLifecycle\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?lifecycle\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketLifecycleRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketDELETElifecycle.html\",\
      \"documentation\":\"<p>Deletes the lifecycle configuration from the bucket.</p>\"\
    },\
    \"DeleteBucketMetricsConfiguration\":{\
      \"name\":\"DeleteBucketMetricsConfiguration\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?metrics\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketMetricsConfigurationRequest\"},\
      \"documentation\":\"<p>Deletes a metrics configuration (specified by the metrics configuration ID) from the bucket.</p>\"\
    },\
    \"DeleteBucketPolicy\":{\
      \"name\":\"DeleteBucketPolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?policy\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketPolicyRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketDELETEpolicy.html\",\
      \"documentation\":\"<p>Deletes the policy from the bucket.</p>\"\
    },\
    \"DeleteBucketReplication\":{\
      \"name\":\"DeleteBucketReplication\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?replication\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketReplicationRequest\"},\
      \"documentation\":\"<p>Deletes the replication configuration from the bucket.</p>\"\
    },\
    \"DeleteBucketTagging\":{\
      \"name\":\"DeleteBucketTagging\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?tagging\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketTaggingRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketDELETEtagging.html\",\
      \"documentation\":\"<p>Deletes the tags from the bucket.</p>\"\
    },\
    \"DeleteBucketWebsite\":{\
      \"name\":\"DeleteBucketWebsite\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}?website\"\
      },\
      \"input\":{\"shape\":\"DeleteBucketWebsiteRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketDELETEwebsite.html\",\
      \"documentation\":\"<p>This operation removes the website configuration from the bucket.</p>\"\
    },\
    \"DeleteObject\":{\
      \"name\":\"DeleteObject\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"DeleteObjectRequest\"},\
      \"output\":{\"shape\":\"DeleteObjectOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectDELETE.html\",\
      \"documentation\":\"<p>Removes the null version (if there is one) of an object and inserts a delete marker, which becomes the latest version of the object. If there isn't a null version, Amazon S3 does not remove any objects.</p>\"\
    },\
    \"DeleteObjectTagging\":{\
      \"name\":\"DeleteObjectTagging\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/{Bucket}/{Key+}?tagging\"\
      },\
      \"input\":{\"shape\":\"DeleteObjectTaggingRequest\"},\
      \"output\":{\"shape\":\"DeleteObjectTaggingOutput\"},\
      \"documentation\":\"<p>Removes the tag-set from an existing object.</p>\"\
    },\
    \"DeleteObjects\":{\
      \"name\":\"DeleteObjects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/{Bucket}?delete\"\
      },\
      \"input\":{\"shape\":\"DeleteObjectsRequest\"},\
      \"output\":{\"shape\":\"DeleteObjectsOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/multiobjectdeleteapi.html\",\
      \"documentation\":\"<p>This operation enables you to delete multiple objects from a bucket using a single HTTP request. You may specify up to 1000 keys.</p>\",\
      \"alias\":\"DeleteMultipleObjects\"\
    },\
    \"GetBucketAccelerateConfiguration\":{\
      \"name\":\"GetBucketAccelerateConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?accelerate\"\
      },\
      \"input\":{\"shape\":\"GetBucketAccelerateConfigurationRequest\"},\
      \"output\":{\"shape\":\"GetBucketAccelerateConfigurationOutput\"},\
      \"documentation\":\"<p>Returns the accelerate configuration of a bucket.</p>\"\
    },\
    \"GetBucketAcl\":{\
      \"name\":\"GetBucketAcl\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?acl\"\
      },\
      \"input\":{\"shape\":\"GetBucketAclRequest\"},\
      \"output\":{\"shape\":\"GetBucketAclOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETacl.html\",\
      \"documentation\":\"<p>Gets the access control policy for the bucket.</p>\"\
    },\
    \"GetBucketAnalyticsConfiguration\":{\
      \"name\":\"GetBucketAnalyticsConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?analytics\"\
      },\
      \"input\":{\"shape\":\"GetBucketAnalyticsConfigurationRequest\"},\
      \"output\":{\"shape\":\"GetBucketAnalyticsConfigurationOutput\"},\
      \"documentation\":\"<p>Gets an analytics configuration for the bucket (specified by the analytics configuration ID).</p>\"\
    },\
    \"GetBucketCors\":{\
      \"name\":\"GetBucketCors\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?cors\"\
      },\
      \"input\":{\"shape\":\"GetBucketCorsRequest\"},\
      \"output\":{\"shape\":\"GetBucketCorsOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETcors.html\",\
      \"documentation\":\"<p>Returns the cors configuration for the bucket.</p>\"\
    },\
    \"GetBucketEncryption\":{\
      \"name\":\"GetBucketEncryption\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?encryption\"\
      },\
      \"input\":{\"shape\":\"GetBucketEncryptionRequest\"},\
      \"output\":{\"shape\":\"GetBucketEncryptionOutput\"},\
      \"documentation\":\"<p>Returns the server-side encryption configuration of a bucket.</p>\"\
    },\
    \"GetBucketInventoryConfiguration\":{\
      \"name\":\"GetBucketInventoryConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?inventory\"\
      },\
      \"input\":{\"shape\":\"GetBucketInventoryConfigurationRequest\"},\
      \"output\":{\"shape\":\"GetBucketInventoryConfigurationOutput\"},\
      \"documentation\":\"<p>Returns an inventory configuration (identified by the inventory ID) from the bucket.</p>\"\
    },\
    \"GetBucketLifecycle\":{\
      \"name\":\"GetBucketLifecycle\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?lifecycle\"\
      },\
      \"input\":{\"shape\":\"GetBucketLifecycleRequest\"},\
      \"output\":{\"shape\":\"GetBucketLifecycleOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETlifecycle.html\",\
      \"documentation\":\"<p>Deprecated, see the GetBucketLifecycleConfiguration operation.</p>\",\
      \"deprecated\":true\
    },\
    \"GetBucketLifecycleConfiguration\":{\
      \"name\":\"GetBucketLifecycleConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?lifecycle\"\
      },\
      \"input\":{\"shape\":\"GetBucketLifecycleConfigurationRequest\"},\
      \"output\":{\"shape\":\"GetBucketLifecycleConfigurationOutput\"},\
      \"documentation\":\"<p>Returns the lifecycle configuration information set on the bucket.</p>\"\
    },\
    \"GetBucketLocation\":{\
      \"name\":\"GetBucketLocation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?location\"\
      },\
      \"input\":{\"shape\":\"GetBucketLocationRequest\"},\
      \"output\":{\"shape\":\"GetBucketLocationOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETlocation.html\",\
      \"documentation\":\"<p>Returns the region the bucket resides in.</p>\"\
    },\
    \"GetBucketLogging\":{\
      \"name\":\"GetBucketLogging\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?logging\"\
      },\
      \"input\":{\"shape\":\"GetBucketLoggingRequest\"},\
      \"output\":{\"shape\":\"GetBucketLoggingOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETlogging.html\",\
      \"documentation\":\"<p>Returns the logging status of a bucket and the permissions users have to view and modify that status. To use GET, you must be the bucket owner.</p>\"\
    },\
    \"GetBucketMetricsConfiguration\":{\
      \"name\":\"GetBucketMetricsConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?metrics\"\
      },\
      \"input\":{\"shape\":\"GetBucketMetricsConfigurationRequest\"},\
      \"output\":{\"shape\":\"GetBucketMetricsConfigurationOutput\"},\
      \"documentation\":\"<p>Gets a metrics configuration (specified by the metrics configuration ID) from the bucket.</p>\"\
    },\
    \"GetBucketNotification\":{\
      \"name\":\"GetBucketNotification\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?notification\"\
      },\
      \"input\":{\"shape\":\"GetBucketNotificationConfigurationRequest\"},\
      \"output\":{\"shape\":\"NotificationConfigurationDeprecated\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETnotification.html\",\
      \"documentation\":\"<p>Deprecated, see the GetBucketNotificationConfiguration operation.</p>\",\
      \"deprecated\":true\
    },\
    \"GetBucketNotificationConfiguration\":{\
      \"name\":\"GetBucketNotificationConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?notification\"\
      },\
      \"input\":{\"shape\":\"GetBucketNotificationConfigurationRequest\"},\
      \"output\":{\"shape\":\"NotificationConfiguration\"},\
      \"documentation\":\"<p>Returns the notification configuration of a bucket.</p>\"\
    },\
    \"GetBucketPolicy\":{\
      \"name\":\"GetBucketPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?policy\"\
      },\
      \"input\":{\"shape\":\"GetBucketPolicyRequest\"},\
      \"output\":{\"shape\":\"GetBucketPolicyOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETpolicy.html\",\
      \"documentation\":\"<p>Returns the policy of a specified bucket.</p>\"\
    },\
    \"GetBucketReplication\":{\
      \"name\":\"GetBucketReplication\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?replication\"\
      },\
      \"input\":{\"shape\":\"GetBucketReplicationRequest\"},\
      \"output\":{\"shape\":\"GetBucketReplicationOutput\"},\
      \"documentation\":\"<p>Returns the replication configuration of a bucket.</p>\"\
    },\
    \"GetBucketRequestPayment\":{\
      \"name\":\"GetBucketRequestPayment\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?requestPayment\"\
      },\
      \"input\":{\"shape\":\"GetBucketRequestPaymentRequest\"},\
      \"output\":{\"shape\":\"GetBucketRequestPaymentOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTrequestPaymentGET.html\",\
      \"documentation\":\"<p>Returns the request payment configuration of a bucket.</p>\"\
    },\
    \"GetBucketTagging\":{\
      \"name\":\"GetBucketTagging\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?tagging\"\
      },\
      \"input\":{\"shape\":\"GetBucketTaggingRequest\"},\
      \"output\":{\"shape\":\"GetBucketTaggingOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETtagging.html\",\
      \"documentation\":\"<p>Returns the tag set associated with the bucket.</p>\"\
    },\
    \"GetBucketVersioning\":{\
      \"name\":\"GetBucketVersioning\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?versioning\"\
      },\
      \"input\":{\"shape\":\"GetBucketVersioningRequest\"},\
      \"output\":{\"shape\":\"GetBucketVersioningOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETversioningStatus.html\",\
      \"documentation\":\"<p>Returns the versioning state of a bucket.</p>\"\
    },\
    \"GetBucketWebsite\":{\
      \"name\":\"GetBucketWebsite\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?website\"\
      },\
      \"input\":{\"shape\":\"GetBucketWebsiteRequest\"},\
      \"output\":{\"shape\":\"GetBucketWebsiteOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETwebsite.html\",\
      \"documentation\":\"<p>Returns the website configuration for a bucket.</p>\"\
    },\
    \"GetObject\":{\
      \"name\":\"GetObject\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"GetObjectRequest\"},\
      \"output\":{\"shape\":\"GetObjectOutput\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchKey\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectGET.html\",\
      \"documentation\":\"<p>Retrieves objects from Amazon S3.</p>\"\
    },\
    \"GetObjectAcl\":{\
      \"name\":\"GetObjectAcl\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}/{Key+}?acl\"\
      },\
      \"input\":{\"shape\":\"GetObjectAclRequest\"},\
      \"output\":{\"shape\":\"GetObjectAclOutput\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchKey\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectGETacl.html\",\
      \"documentation\":\"<p>Returns the access control list (ACL) of an object.</p>\"\
    },\
    \"GetObjectTagging\":{\
      \"name\":\"GetObjectTagging\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}/{Key+}?tagging\"\
      },\
      \"input\":{\"shape\":\"GetObjectTaggingRequest\"},\
      \"output\":{\"shape\":\"GetObjectTaggingOutput\"},\
      \"documentation\":\"<p>Returns the tag-set of an object.</p>\"\
    },\
    \"GetObjectTorrent\":{\
      \"name\":\"GetObjectTorrent\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}/{Key+}?torrent\"\
      },\
      \"input\":{\"shape\":\"GetObjectTorrentRequest\"},\
      \"output\":{\"shape\":\"GetObjectTorrentOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectGETtorrent.html\",\
      \"documentation\":\"<p>Return torrent files from a bucket.</p>\"\
    },\
    \"HeadBucket\":{\
      \"name\":\"HeadBucket\",\
      \"http\":{\
        \"method\":\"HEAD\",\
        \"requestUri\":\"/{Bucket}\"\
      },\
      \"input\":{\"shape\":\"HeadBucketRequest\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchBucket\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketHEAD.html\",\
      \"documentation\":\"<p>This operation is useful to determine if a bucket exists and you have permission to access it.</p>\"\
    },\
    \"HeadObject\":{\
      \"name\":\"HeadObject\",\
      \"http\":{\
        \"method\":\"HEAD\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"HeadObjectRequest\"},\
      \"output\":{\"shape\":\"HeadObjectOutput\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchKey\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectHEAD.html\",\
      \"documentation\":\"<p>The HEAD operation retrieves metadata from an object without returning the object itself. This operation is useful if you're only interested in an object's metadata. To use HEAD, you must have READ access to the object.</p>\"\
    },\
    \"ListBucketAnalyticsConfigurations\":{\
      \"name\":\"ListBucketAnalyticsConfigurations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?analytics\"\
      },\
      \"input\":{\"shape\":\"ListBucketAnalyticsConfigurationsRequest\"},\
      \"output\":{\"shape\":\"ListBucketAnalyticsConfigurationsOutput\"},\
      \"documentation\":\"<p>Lists the analytics configurations for the bucket.</p>\"\
    },\
    \"ListBucketInventoryConfigurations\":{\
      \"name\":\"ListBucketInventoryConfigurations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?inventory\"\
      },\
      \"input\":{\"shape\":\"ListBucketInventoryConfigurationsRequest\"},\
      \"output\":{\"shape\":\"ListBucketInventoryConfigurationsOutput\"},\
      \"documentation\":\"<p>Returns a list of inventory configurations for the bucket.</p>\"\
    },\
    \"ListBucketMetricsConfigurations\":{\
      \"name\":\"ListBucketMetricsConfigurations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?metrics\"\
      },\
      \"input\":{\"shape\":\"ListBucketMetricsConfigurationsRequest\"},\
      \"output\":{\"shape\":\"ListBucketMetricsConfigurationsOutput\"},\
      \"documentation\":\"<p>Lists the metrics configurations for the bucket.</p>\"\
    },\
    \"ListBuckets\":{\
      \"name\":\"ListBuckets\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\"shape\":\"ListBucketsOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTServiceGET.html\",\
      \"documentation\":\"<p>Returns a list of all buckets owned by the authenticated sender of the request.</p>\",\
      \"alias\":\"GetService\"\
    },\
    \"ListMultipartUploads\":{\
      \"name\":\"ListMultipartUploads\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?uploads\"\
      },\
      \"input\":{\"shape\":\"ListMultipartUploadsRequest\"},\
      \"output\":{\"shape\":\"ListMultipartUploadsOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadListMPUpload.html\",\
      \"documentation\":\"<p>This operation lists in-progress multipart uploads.</p>\"\
    },\
    \"ListObjectVersions\":{\
      \"name\":\"ListObjectVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?versions\"\
      },\
      \"input\":{\"shape\":\"ListObjectVersionsRequest\"},\
      \"output\":{\"shape\":\"ListObjectVersionsOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGETVersion.html\",\
      \"documentation\":\"<p>Returns metadata about all of the versions of objects in a bucket.</p>\",\
      \"alias\":\"GetBucketObjectVersions\"\
    },\
    \"ListObjects\":{\
      \"name\":\"ListObjects\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}\"\
      },\
      \"input\":{\"shape\":\"ListObjectsRequest\"},\
      \"output\":{\"shape\":\"ListObjectsOutput\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchBucket\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketGET.html\",\
      \"documentation\":\"<p>Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket.</p>\",\
      \"alias\":\"GetBucket\"\
    },\
    \"ListObjectsV2\":{\
      \"name\":\"ListObjectsV2\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}?list-type=2\"\
      },\
      \"input\":{\"shape\":\"ListObjectsV2Request\"},\
      \"output\":{\"shape\":\"ListObjectsV2Output\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchBucket\"}\
      ],\
      \"documentation\":\"<p>Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket. Note: ListObjectsV2 is the revised List Objects API and we recommend you use this revised API for new application development.</p>\"\
    },\
    \"ListParts\":{\
      \"name\":\"ListParts\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"ListPartsRequest\"},\
      \"output\":{\"shape\":\"ListPartsOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadListParts.html\",\
      \"documentation\":\"<p>Lists the parts that have been uploaded for a specific multipart upload.</p>\"\
    },\
    \"PutBucketAccelerateConfiguration\":{\
      \"name\":\"PutBucketAccelerateConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?accelerate\"\
      },\
      \"input\":{\"shape\":\"PutBucketAccelerateConfigurationRequest\"},\
      \"documentation\":\"<p>Sets the accelerate configuration of an existing bucket.</p>\"\
    },\
    \"PutBucketAcl\":{\
      \"name\":\"PutBucketAcl\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?acl\"\
      },\
      \"input\":{\"shape\":\"PutBucketAclRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTacl.html\",\
      \"documentation\":\"<p>Sets the permissions on a bucket using access control lists (ACL).</p>\"\
    },\
    \"PutBucketAnalyticsConfiguration\":{\
      \"name\":\"PutBucketAnalyticsConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?analytics\"\
      },\
      \"input\":{\"shape\":\"PutBucketAnalyticsConfigurationRequest\"},\
      \"documentation\":\"<p>Sets an analytics configuration for the bucket (specified by the analytics configuration ID).</p>\"\
    },\
    \"PutBucketCors\":{\
      \"name\":\"PutBucketCors\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?cors\"\
      },\
      \"input\":{\"shape\":\"PutBucketCorsRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTcors.html\",\
      \"documentation\":\"<p>Sets the cors configuration for a bucket.</p>\"\
    },\
    \"PutBucketEncryption\":{\
      \"name\":\"PutBucketEncryption\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?encryption\"\
      },\
      \"input\":{\"shape\":\"PutBucketEncryptionRequest\"},\
      \"documentation\":\"<p>Creates a new server-side encryption configuration (or replaces an existing one, if present).</p>\"\
    },\
    \"PutBucketInventoryConfiguration\":{\
      \"name\":\"PutBucketInventoryConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?inventory\"\
      },\
      \"input\":{\"shape\":\"PutBucketInventoryConfigurationRequest\"},\
      \"documentation\":\"<p>Adds an inventory configuration (identified by the inventory ID) from the bucket.</p>\"\
    },\
    \"PutBucketLifecycle\":{\
      \"name\":\"PutBucketLifecycle\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?lifecycle\"\
      },\
      \"input\":{\"shape\":\"PutBucketLifecycleRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTlifecycle.html\",\
      \"documentation\":\"<p>Deprecated, see the PutBucketLifecycleConfiguration operation.</p>\",\
      \"deprecated\":true\
    },\
    \"PutBucketLifecycleConfiguration\":{\
      \"name\":\"PutBucketLifecycleConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?lifecycle\"\
      },\
      \"input\":{\"shape\":\"PutBucketLifecycleConfigurationRequest\"},\
      \"documentation\":\"<p>Sets lifecycle configuration for your bucket. If a lifecycle configuration exists, it replaces it.</p>\"\
    },\
    \"PutBucketLogging\":{\
      \"name\":\"PutBucketLogging\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?logging\"\
      },\
      \"input\":{\"shape\":\"PutBucketLoggingRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTlogging.html\",\
      \"documentation\":\"<p>Set the logging parameters for a bucket and to specify permissions for who can view and modify the logging parameters. To set the logging status of a bucket, you must be the bucket owner.</p>\"\
    },\
    \"PutBucketMetricsConfiguration\":{\
      \"name\":\"PutBucketMetricsConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?metrics\"\
      },\
      \"input\":{\"shape\":\"PutBucketMetricsConfigurationRequest\"},\
      \"documentation\":\"<p>Sets a metrics configuration (specified by the metrics configuration ID) for the bucket.</p>\"\
    },\
    \"PutBucketNotification\":{\
      \"name\":\"PutBucketNotification\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?notification\"\
      },\
      \"input\":{\"shape\":\"PutBucketNotificationRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTnotification.html\",\
      \"documentation\":\"<p>Deprecated, see the PutBucketNotificationConfiguraiton operation.</p>\",\
      \"deprecated\":true\
    },\
    \"PutBucketNotificationConfiguration\":{\
      \"name\":\"PutBucketNotificationConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?notification\"\
      },\
      \"input\":{\"shape\":\"PutBucketNotificationConfigurationRequest\"},\
      \"documentation\":\"<p>Enables notifications of specified events for a bucket.</p>\"\
    },\
    \"PutBucketPolicy\":{\
      \"name\":\"PutBucketPolicy\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?policy\"\
      },\
      \"input\":{\"shape\":\"PutBucketPolicyRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTpolicy.html\",\
      \"documentation\":\"<p>Replaces a policy on a bucket. If the bucket already has a policy, the one in this request completely replaces it.</p>\"\
    },\
    \"PutBucketReplication\":{\
      \"name\":\"PutBucketReplication\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?replication\"\
      },\
      \"input\":{\"shape\":\"PutBucketReplicationRequest\"},\
      \"documentation\":\"<p> Creates a new replication configuration (or replaces an existing one, if present). For more information, see <a href=\\\" https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html\\\">Cross-Region Replication (CRR)</a> in the Amazon S3 Developer Guide. </p>\"\
    },\
    \"PutBucketRequestPayment\":{\
      \"name\":\"PutBucketRequestPayment\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?requestPayment\"\
      },\
      \"input\":{\"shape\":\"PutBucketRequestPaymentRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTrequestPaymentPUT.html\",\
      \"documentation\":\"<p>Sets the request payment configuration for a bucket. By default, the bucket owner pays for downloads from the bucket. This configuration parameter enables the bucket owner (only) to specify that the person requesting the download will be charged for the download. Documentation on requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html</p>\"\
    },\
    \"PutBucketTagging\":{\
      \"name\":\"PutBucketTagging\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?tagging\"\
      },\
      \"input\":{\"shape\":\"PutBucketTaggingRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTtagging.html\",\
      \"documentation\":\"<p>Sets the tags for a bucket.</p>\"\
    },\
    \"PutBucketVersioning\":{\
      \"name\":\"PutBucketVersioning\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?versioning\"\
      },\
      \"input\":{\"shape\":\"PutBucketVersioningRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTVersioningStatus.html\",\
      \"documentation\":\"<p>Sets the versioning state of an existing bucket. To set the versioning state, you must be the bucket owner.</p>\"\
    },\
    \"PutBucketWebsite\":{\
      \"name\":\"PutBucketWebsite\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}?website\"\
      },\
      \"input\":{\"shape\":\"PutBucketWebsiteRequest\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUTwebsite.html\",\
      \"documentation\":\"<p>Set the website configuration for a bucket.</p>\"\
    },\
    \"PutObject\":{\
      \"name\":\"PutObject\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"PutObjectRequest\"},\
      \"output\":{\"shape\":\"PutObjectOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectPUT.html\",\
      \"documentation\":\"<p>Adds an object to a bucket.</p>\"\
    },\
    \"PutObjectAcl\":{\
      \"name\":\"PutObjectAcl\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}/{Key+}?acl\"\
      },\
      \"input\":{\"shape\":\"PutObjectAclRequest\"},\
      \"output\":{\"shape\":\"PutObjectAclOutput\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchKey\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectPUTacl.html\",\
      \"documentation\":\"<p>uses the acl subresource to set the access control list (ACL) permissions for an object that already exists in a bucket</p>\"\
    },\
    \"PutObjectTagging\":{\
      \"name\":\"PutObjectTagging\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}/{Key+}?tagging\"\
      },\
      \"input\":{\"shape\":\"PutObjectTaggingRequest\"},\
      \"output\":{\"shape\":\"PutObjectTaggingOutput\"},\
      \"documentation\":\"<p>Sets the supplied tag-set to an object that already exists in a bucket</p>\"\
    },\
    \"RestoreObject\":{\
      \"name\":\"RestoreObject\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/{Bucket}/{Key+}?restore\"\
      },\
      \"input\":{\"shape\":\"RestoreObjectRequest\"},\
      \"output\":{\"shape\":\"RestoreObjectOutput\"},\
      \"errors\":[\
        {\"shape\":\"ObjectAlreadyInActiveTierError\"}\
      ],\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectRestore.html\",\
      \"documentation\":\"<p>Restores an archived copy of an object back into Amazon S3</p>\",\
      \"alias\":\"PostObjectRestore\"\
    },\
    \"SelectObjectContent\":{\
      \"name\":\"SelectObjectContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/{Bucket}/{Key+}?select&select-type=2\"\
      },\
      \"input\":{\
        \"shape\":\"SelectObjectContentRequest\",\
        \"locationName\":\"SelectObjectContentRequest\",\
        \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
      },\
      \"output\":{\"shape\":\"SelectObjectContentOutput\"},\
      \"documentation\":\"<p>This operation filters the contents of an Amazon S3 object based on a simple Structured Query Language (SQL) statement. In the request, along with the SQL expression, you must also specify a data serialization format (JSON or CSV) of the object. Amazon S3 uses this to parse object data into records, and returns only records that match the specified SQL expression. You must also specify the data serialization format for the response.</p>\"\
    },\
    \"UploadPart\":{\
      \"name\":\"UploadPart\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"UploadPartRequest\"},\
      \"output\":{\"shape\":\"UploadPartOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadUploadPart.html\",\
      \"documentation\":\"<p>Uploads a part in a multipart upload.</p> <p> <b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>\"\
    },\
    \"UploadPartCopy\":{\
      \"name\":\"UploadPartCopy\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/{Bucket}/{Key+}\"\
      },\
      \"input\":{\"shape\":\"UploadPartCopyRequest\"},\
      \"output\":{\"shape\":\"UploadPartCopyOutput\"},\
      \"documentationUrl\":\"http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadUploadPartCopy.html\",\
      \"documentation\":\"<p>Uploads a part by copying data from an existing object as data source.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AbortDate\":{\"type\":\"timestamp\"},\
    \"AbortIncompleteMultipartUpload\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DaysAfterInitiation\":{\
          \"shape\":\"DaysAfterInitiation\",\
          \"documentation\":\"<p>Indicates the number of days that must pass since initiation for Lifecycle to abort an Incomplete Multipart Upload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.</p>\"\
    },\
    \"AbortMultipartUploadOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"AbortMultipartUploadRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\",\
        \"UploadId\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"location\":\"querystring\",\
          \"locationName\":\"uploadId\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"AbortRuleId\":{\"type\":\"string\"},\
    \"AccelerateConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"BucketAccelerateStatus\",\
          \"documentation\":\"<p>The accelerate configuration of the bucket.</p>\"\
        }\
      }\
    },\
    \"AcceptRanges\":{\"type\":\"string\"},\
    \"AccessControlPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Grants\":{\
          \"shape\":\"Grants\",\
          \"documentation\":\"<p>A list of grants.</p>\",\
          \"locationName\":\"AccessControlList\"\
        },\
        \"Owner\":{\"shape\":\"Owner\"}\
      }\
    },\
    \"AccessControlTranslation\":{\
      \"type\":\"structure\",\
      \"required\":[\"Owner\"],\
      \"members\":{\
        \"Owner\":{\
          \"shape\":\"OwnerOverride\",\
          \"documentation\":\"<p>The override value for the owner of the replica object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for information regarding the access control for replicas.</p>\"\
    },\
    \"AccountId\":{\"type\":\"string\"},\
    \"AllowQuotedRecordDelimiter\":{\"type\":\"boolean\"},\
    \"AllowedHeader\":{\"type\":\"string\"},\
    \"AllowedHeaders\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AllowedHeader\"},\
      \"flattened\":true\
    },\
    \"AllowedMethod\":{\"type\":\"string\"},\
    \"AllowedMethods\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AllowedMethod\"},\
      \"flattened\":true\
    },\
    \"AllowedOrigin\":{\"type\":\"string\"},\
    \"AllowedOrigins\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AllowedOrigin\"},\
      \"flattened\":true\
    },\
    \"AnalyticsAndOperator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix to use when evaluating an AND predicate.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagSet\",\
          \"documentation\":\"<p>The list of tags to use when evaluating an AND predicate.</p>\",\
          \"flattened\":true,\
          \"locationName\":\"Tag\"\
        }\
      }\
    },\
    \"AnalyticsConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"StorageClassAnalysis\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"AnalyticsId\",\
          \"documentation\":\"<p>The identifier used to represent an analytics configuration.</p>\"\
        },\
        \"Filter\":{\
          \"shape\":\"AnalyticsFilter\",\
          \"documentation\":\"<p>The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.</p>\"\
        },\
        \"StorageClassAnalysis\":{\
          \"shape\":\"StorageClassAnalysis\",\
          \"documentation\":\"<p>If present, it indicates that data related to access patterns will be collected and made available to analyze the tradeoffs between different storage classes.</p>\"\
        }\
      }\
    },\
    \"AnalyticsConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AnalyticsConfiguration\"},\
      \"flattened\":true\
    },\
    \"AnalyticsExportDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3BucketDestination\"],\
      \"members\":{\
        \"S3BucketDestination\":{\
          \"shape\":\"AnalyticsS3BucketDestination\",\
          \"documentation\":\"<p>A destination signifying output to an S3 bucket.</p>\"\
        }\
      }\
    },\
    \"AnalyticsFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix to use when evaluating an analytics filter.</p>\"\
        },\
        \"Tag\":{\
          \"shape\":\"Tag\",\
          \"documentation\":\"<p>The tag to use when evaluating an analytics filter.</p>\"\
        },\
        \"And\":{\
          \"shape\":\"AnalyticsAndOperator\",\
          \"documentation\":\"<p>A conjunction (logical AND) of predicates, which is used in evaluating an analytics filter. The operator must have at least two predicates.</p>\"\
        }\
      }\
    },\
    \"AnalyticsId\":{\"type\":\"string\"},\
    \"AnalyticsS3BucketDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Format\",\
        \"Bucket\"\
      ],\
      \"members\":{\
        \"Format\":{\
          \"shape\":\"AnalyticsS3ExportFileFormat\",\
          \"documentation\":\"<p>The file format used when exporting data to Amazon S3.</p>\"\
        },\
        \"BucketAccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The account ID that owns the destination bucket. If no account ID is provided, the owner will not be validated prior to exporting data.</p>\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The Amazon resource name (ARN) of the bucket to which data is exported.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix to use when exporting data. The exported data begins with this prefix.</p>\"\
        }\
      }\
    },\
    \"AnalyticsS3ExportFileFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\"CSV\"]\
    },\
    \"Body\":{\"type\":\"blob\"},\
    \"Bucket\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>Date the bucket was created.</p>\"\
        }\
      }\
    },\
    \"BucketAccelerateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Suspended\"\
      ]\
    },\
    \"BucketAlreadyExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested bucket name is not available. The bucket namespace is shared by all users of the system. Please select a different name and try again.</p>\",\
      \"exception\":true\
    },\
    \"BucketAlreadyOwnedByYou\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"exception\":true\
    },\
    \"BucketCannedACL\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"private\",\
        \"public-read\",\
        \"public-read-write\",\
        \"authenticated-read\"\
      ]\
    },\
    \"BucketLifecycleConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Rules\"],\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"LifecycleRules\",\
          \"locationName\":\"Rule\"\
        }\
      }\
    },\
    \"BucketLocationConstraint\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"\",\
        \"EU\",\
        \"eu-west-1\",\
        \"us-west-1\",\
        \"us-west-2\",\
        \"eu-west-2\",\
        \"eu-west-3\",\
        \"us-east-2\",\
        \"ap-south-1\",\
        \"ap-southeast-1\",\
        \"ap-southeast-2\",\
        \"ap-northeast-1\",\
        \"ap-northeast-2\",\
        \"sa-east-1\",\
        \"cn-north-1\",\
        \"cn-northwest-1\",\
        \"us-gov-west-1\",\
        \"eu-central-1\",\
        \"ca-central-1\",\
        \"us-gov-east-1\",\
        \"eu-north-1\"\
      ]\
    },\
    \"BucketLoggingStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoggingEnabled\":{\"shape\":\"LoggingEnabled\"}\
      }\
    },\
    \"BucketLogsPermission\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FULL_CONTROL\",\
        \"READ\",\
        \"WRITE\"\
      ]\
    },\
    \"BucketName\":{\"type\":\"string\"},\
    \"BucketVersioningStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Suspended\"\
      ]\
    },\
    \"Buckets\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Bucket\",\
        \"locationName\":\"Bucket\"\
      }\
    },\
    \"BytesProcessed\":{\"type\":\"long\"},\
    \"BytesReturned\":{\"type\":\"long\"},\
    \"BytesScanned\":{\"type\":\"long\"},\
    \"CORSConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"CORSRules\"],\
      \"members\":{\
        \"CORSRules\":{\
          \"shape\":\"CORSRules\",\
          \"locationName\":\"CORSRule\"\
        }\
      }\
    },\
    \"CORSRule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AllowedMethods\",\
        \"AllowedOrigins\"\
      ],\
      \"members\":{\
        \"AllowedHeaders\":{\
          \"shape\":\"AllowedHeaders\",\
          \"documentation\":\"<p>Specifies which headers are allowed in a pre-flight OPTIONS request.</p>\",\
          \"locationName\":\"AllowedHeader\"\
        },\
        \"AllowedMethods\":{\
          \"shape\":\"AllowedMethods\",\
          \"documentation\":\"<p>Identifies HTTP methods that the domain/origin specified in the rule is allowed to execute.</p>\",\
          \"locationName\":\"AllowedMethod\"\
        },\
        \"AllowedOrigins\":{\
          \"shape\":\"AllowedOrigins\",\
          \"documentation\":\"<p>One or more origins you want customers to be able to access the bucket from.</p>\",\
          \"locationName\":\"AllowedOrigin\"\
        },\
        \"ExposeHeaders\":{\
          \"shape\":\"ExposeHeaders\",\
          \"documentation\":\"<p>One or more headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).</p>\",\
          \"locationName\":\"ExposeHeader\"\
        },\
        \"MaxAgeSeconds\":{\
          \"shape\":\"MaxAgeSeconds\",\
          \"documentation\":\"<p>The time in seconds that your browser is to cache the preflight response for the specified resource.</p>\"\
        }\
      }\
    },\
    \"CORSRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CORSRule\"},\
      \"flattened\":true\
    },\
    \"CSVInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileHeaderInfo\":{\
          \"shape\":\"FileHeaderInfo\",\
          \"documentation\":\"<p>Describes the first line of input. Valid values: None, Ignore, Use.</p>\"\
        },\
        \"Comments\":{\
          \"shape\":\"Comments\",\
          \"documentation\":\"<p>Single character used to indicate a row should be ignored when present at the start of a row.</p>\"\
        },\
        \"QuoteEscapeCharacter\":{\
          \"shape\":\"QuoteEscapeCharacter\",\
          \"documentation\":\"<p>Single character used for escaping the quote character inside an already escaped value.</p>\"\
        },\
        \"RecordDelimiter\":{\
          \"shape\":\"RecordDelimiter\",\
          \"documentation\":\"<p>Value used to separate individual records.</p>\"\
        },\
        \"FieldDelimiter\":{\
          \"shape\":\"FieldDelimiter\",\
          \"documentation\":\"<p>Value used to separate individual fields in a record.</p>\"\
        },\
        \"QuoteCharacter\":{\
          \"shape\":\"QuoteCharacter\",\
          \"documentation\":\"<p>Value used for escaping where the field delimiter is part of the value.</p>\"\
        },\
        \"AllowQuotedRecordDelimiter\":{\
          \"shape\":\"AllowQuotedRecordDelimiter\",\
          \"documentation\":\"<p>Specifies that CSV field values may contain quoted record delimiters and such records should be allowed. Default value is FALSE. Setting this value to TRUE may lower performance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes how a CSV-formatted input object is formatted.</p>\"\
    },\
    \"CSVOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuoteFields\":{\
          \"shape\":\"QuoteFields\",\
          \"documentation\":\"<p>Indicates whether or not all output fields should be quoted.</p>\"\
        },\
        \"QuoteEscapeCharacter\":{\
          \"shape\":\"QuoteEscapeCharacter\",\
          \"documentation\":\"<p>Single character used for escaping the quote character inside an already escaped value.</p>\"\
        },\
        \"RecordDelimiter\":{\
          \"shape\":\"RecordDelimiter\",\
          \"documentation\":\"<p>Value used to separate individual records.</p>\"\
        },\
        \"FieldDelimiter\":{\
          \"shape\":\"FieldDelimiter\",\
          \"documentation\":\"<p>Value used to separate individual fields in a record.</p>\"\
        },\
        \"QuoteCharacter\":{\
          \"shape\":\"QuoteCharacter\",\
          \"documentation\":\"<p>Value used for escaping where the field delimiter is part of the value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes how CSV-formatted results are formatted.</p>\"\
    },\
    \"CacheControl\":{\"type\":\"string\"},\
    \"CloudFunction\":{\"type\":\"string\"},\
    \"CloudFunctionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\"shape\":\"NotificationId\"},\
        \"Event\":{\
          \"shape\":\"Event\",\
          \"deprecated\":true\
        },\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"locationName\":\"Event\"\
        },\
        \"CloudFunction\":{\"shape\":\"CloudFunction\"},\
        \"InvocationRole\":{\"shape\":\"CloudFunctionInvocationRole\"}\
      }\
    },\
    \"CloudFunctionInvocationRole\":{\"type\":\"string\"},\
    \"Code\":{\"type\":\"string\"},\
    \"Comments\":{\"type\":\"string\"},\
    \"CommonPrefix\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\"shape\":\"Prefix\"}\
      }\
    },\
    \"CommonPrefixList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CommonPrefix\"},\
      \"flattened\":true\
    },\
    \"CompleteMultipartUploadOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Location\":{\"shape\":\"Location\"},\
        \"Bucket\":{\"shape\":\"BucketName\"},\
        \"Key\":{\"shape\":\"ObjectKey\"},\
        \"Expiration\":{\
          \"shape\":\"Expiration\",\
          \"documentation\":\"<p>If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-expiration\"\
        },\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>Entity tag of the object.</p>\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version of the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"CompleteMultipartUploadRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\",\
        \"UploadId\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"MultipartUpload\":{\
          \"shape\":\"CompletedMultipartUpload\",\
          \"locationName\":\"CompleteMultipartUpload\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"location\":\"querystring\",\
          \"locationName\":\"uploadId\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      },\
      \"payload\":\"MultipartUpload\"\
    },\
    \"CompletedMultipartUpload\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Parts\":{\
          \"shape\":\"CompletedPartList\",\
          \"locationName\":\"Part\"\
        }\
      }\
    },\
    \"CompletedPart\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>Entity tag returned when the part was uploaded.</p>\"\
        },\
        \"PartNumber\":{\
          \"shape\":\"PartNumber\",\
          \"documentation\":\"<p>Part number that identifies the part. This is a positive integer between 1 and 10,000.</p>\"\
        }\
      }\
    },\
    \"CompletedPartList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompletedPart\"},\
      \"flattened\":true\
    },\
    \"CompressionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"GZIP\",\
        \"BZIP2\"\
      ]\
    },\
    \"Condition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HttpErrorCodeReturnedEquals\":{\
          \"shape\":\"HttpErrorCodeReturnedEquals\",\
          \"documentation\":\"<p>The HTTP error code when the redirect is applied. In the event of an error, if the error code equals this value, then the specified redirect is applied. Required when parent element Condition is specified and sibling KeyPrefixEquals is not specified. If both are specified, then both must be true for the redirect to be applied.</p>\"\
        },\
        \"KeyPrefixEquals\":{\
          \"shape\":\"KeyPrefixEquals\",\
          \"documentation\":\"<p>The object key name prefix when the redirect is applied. For example, to redirect requests for ExamplePage.html, the key prefix will be ExamplePage.html. To redirect request for all pages with the prefix docs/, the key prefix will be /docs, which identifies all objects in the docs/ folder. Required when the parent element Condition is specified and sibling HttpErrorCodeReturnedEquals is not specified. If both conditions are specified, both must be true for the redirect to be applied.</p>\"\
        }\
      }\
    },\
    \"ConfirmRemoveSelfBucketAccess\":{\"type\":\"boolean\"},\
    \"ContentDisposition\":{\"type\":\"string\"},\
    \"ContentEncoding\":{\"type\":\"string\"},\
    \"ContentLanguage\":{\"type\":\"string\"},\
    \"ContentLength\":{\"type\":\"long\"},\
    \"ContentMD5\":{\"type\":\"string\"},\
    \"ContentRange\":{\"type\":\"string\"},\
    \"ContentType\":{\"type\":\"string\"},\
    \"ContinuationEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"event\":true\
    },\
    \"CopyObjectOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CopyObjectResult\":{\"shape\":\"CopyObjectResult\"},\
        \"Expiration\":{\
          \"shape\":\"Expiration\",\
          \"documentation\":\"<p>If the object expiration is configured, the response includes this header.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-expiration\"\
        },\
        \"CopySourceVersionId\":{\
          \"shape\":\"CopySourceVersionId\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-version-id\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version ID of the newly created copy.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      },\
      \"payload\":\"CopyObjectResult\"\
    },\
    \"CopyObjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"CopySource\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"ACL\":{\
          \"shape\":\"ObjectCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-acl\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"CacheControl\":{\
          \"shape\":\"CacheControl\",\
          \"documentation\":\"<p>Specifies caching behavior along the request/reply chain.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Cache-Control\"\
        },\
        \"ContentDisposition\":{\
          \"shape\":\"ContentDisposition\",\
          \"documentation\":\"<p>Specifies presentational information for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Disposition\"\
        },\
        \"ContentEncoding\":{\
          \"shape\":\"ContentEncoding\",\
          \"documentation\":\"<p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Encoding\"\
        },\
        \"ContentLanguage\":{\
          \"shape\":\"ContentLanguage\",\
          \"documentation\":\"<p>The language the content is in.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Language\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the object data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"CopySource\":{\
          \"shape\":\"CopySource\",\
          \"documentation\":\"<p>The name of the source bucket and key name of the source object, separated by a slash (/). Must be URL-encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source\"\
        },\
        \"CopySourceIfMatch\":{\
          \"shape\":\"CopySourceIfMatch\",\
          \"documentation\":\"<p>Copies the object if its entity tag (ETag) matches the specified tag.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-match\"\
        },\
        \"CopySourceIfModifiedSince\":{\
          \"shape\":\"CopySourceIfModifiedSince\",\
          \"documentation\":\"<p>Copies the object if it has been modified since the specified time.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-modified-since\"\
        },\
        \"CopySourceIfNoneMatch\":{\
          \"shape\":\"CopySourceIfNoneMatch\",\
          \"documentation\":\"<p>Copies the object if its entity tag (ETag) is different than the specified ETag.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-none-match\"\
        },\
        \"CopySourceIfUnmodifiedSince\":{\
          \"shape\":\"CopySourceIfUnmodifiedSince\",\
          \"documentation\":\"<p>Copies the object if it hasn't been modified since the specified time.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-unmodified-since\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The date and time at which the object is no longer cacheable.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Expires\"\
        },\
        \"GrantFullControl\":{\
          \"shape\":\"GrantFullControl\",\
          \"documentation\":\"<p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-full-control\"\
        },\
        \"GrantRead\":{\
          \"shape\":\"GrantRead\",\
          \"documentation\":\"<p>Allows grantee to read the object data and its metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read\"\
        },\
        \"GrantReadACP\":{\
          \"shape\":\"GrantReadACP\",\
          \"documentation\":\"<p>Allows grantee to read the object ACL.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read-acp\"\
        },\
        \"GrantWriteACP\":{\
          \"shape\":\"GrantWriteACP\",\
          \"documentation\":\"<p>Allows grantee to write the ACL for the applicable object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write-acp\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>A map of metadata to store with the object in S3.</p>\",\
          \"location\":\"headers\",\
          \"locationName\":\"x-amz-meta-\"\
        },\
        \"MetadataDirective\":{\
          \"shape\":\"MetadataDirective\",\
          \"documentation\":\"<p>Specifies whether the metadata is copied from the source object or replaced with metadata provided in the request.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-metadata-directive\"\
        },\
        \"TaggingDirective\":{\
          \"shape\":\"TaggingDirective\",\
          \"documentation\":\"<p>Specifies whether the object tag-set are copied from the source object or replaced with tag-set provided in the request.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-tagging-directive\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The type of storage to use for the object. Defaults to 'STANDARD'.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-storage-class\"\
        },\
        \"WebsiteRedirectLocation\":{\
          \"shape\":\"WebsiteRedirectLocation\",\
          \"documentation\":\"<p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-website-redirect-location\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"CopySourceSSECustomerAlgorithm\":{\
          \"shape\":\"CopySourceSSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use when decrypting the source object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-server-side-encryption-customer-algorithm\"\
        },\
        \"CopySourceSSECustomerKey\":{\
          \"shape\":\"CopySourceSSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-server-side-encryption-customer-key\"\
        },\
        \"CopySourceSSECustomerKeyMD5\":{\
          \"shape\":\"CopySourceSSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-server-side-encryption-customer-key-MD5\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        },\
        \"Tagging\":{\
          \"shape\":\"TaggingHeader\",\
          \"documentation\":\"<p>The tag-set for the object destination object this value must be used in conjunction with the TaggingDirective. The tag-set must be encoded as URL Query parameters</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-tagging\"\
        }\
      }\
    },\
    \"CopyObjectResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ETag\":{\"shape\":\"ETag\"},\
        \"LastModified\":{\"shape\":\"LastModified\"}\
      }\
    },\
    \"CopyPartResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>Entity tag of the object.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>Date and time at which the object was uploaded.</p>\"\
        }\
      }\
    },\
    \"CopySource\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\/.+\\\\/.+\"\
    },\
    \"CopySourceIfMatch\":{\"type\":\"string\"},\
    \"CopySourceIfModifiedSince\":{\"type\":\"timestamp\"},\
    \"CopySourceIfNoneMatch\":{\"type\":\"string\"},\
    \"CopySourceIfUnmodifiedSince\":{\"type\":\"timestamp\"},\
    \"CopySourceRange\":{\"type\":\"string\"},\
    \"CopySourceSSECustomerAlgorithm\":{\"type\":\"string\"},\
    \"CopySourceSSECustomerKey\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"CopySourceSSECustomerKeyMD5\":{\"type\":\"string\"},\
    \"CopySourceVersionId\":{\"type\":\"string\"},\
    \"CreateBucketConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LocationConstraint\":{\
          \"shape\":\"BucketLocationConstraint\",\
          \"documentation\":\"<p>Specifies the region where the bucket will be created. If you don't specify a region, the bucket will be created in US Standard.</p>\"\
        }\
      }\
    },\
    \"CreateBucketOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Location\":{\
          \"shape\":\"Location\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      }\
    },\
    \"CreateBucketRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"ACL\":{\
          \"shape\":\"BucketCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-acl\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"CreateBucketConfiguration\":{\
          \"shape\":\"CreateBucketConfiguration\",\
          \"locationName\":\"CreateBucketConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"GrantFullControl\":{\
          \"shape\":\"GrantFullControl\",\
          \"documentation\":\"<p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-full-control\"\
        },\
        \"GrantRead\":{\
          \"shape\":\"GrantRead\",\
          \"documentation\":\"<p>Allows grantee to list the objects in the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read\"\
        },\
        \"GrantReadACP\":{\
          \"shape\":\"GrantReadACP\",\
          \"documentation\":\"<p>Allows grantee to read the bucket ACL.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read-acp\"\
        },\
        \"GrantWrite\":{\
          \"shape\":\"GrantWrite\",\
          \"documentation\":\"<p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write\"\
        },\
        \"GrantWriteACP\":{\
          \"shape\":\"GrantWriteACP\",\
          \"documentation\":\"<p>Allows grantee to write the ACL for the applicable bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write-acp\"\
        }\
      },\
      \"payload\":\"CreateBucketConfiguration\"\
    },\
    \"CreateMultipartUploadOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AbortDate\":{\
          \"shape\":\"AbortDate\",\
          \"documentation\":\"<p>Date when multipart upload will become eligible for abort operation by lifecycle.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-abort-date\"\
        },\
        \"AbortRuleId\":{\
          \"shape\":\"AbortRuleId\",\
          \"documentation\":\"<p>Id of the lifecycle rule that makes a multipart upload eligible for abort operation.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-abort-rule-id\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to which the multipart upload was initiated.</p>\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Object key for which the multipart upload was initiated.</p>\"\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"documentation\":\"<p>ID for the initiated multipart upload.</p>\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"CreateMultipartUploadRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"ACL\":{\
          \"shape\":\"ObjectCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-acl\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"CacheControl\":{\
          \"shape\":\"CacheControl\",\
          \"documentation\":\"<p>Specifies caching behavior along the request/reply chain.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Cache-Control\"\
        },\
        \"ContentDisposition\":{\
          \"shape\":\"ContentDisposition\",\
          \"documentation\":\"<p>Specifies presentational information for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Disposition\"\
        },\
        \"ContentEncoding\":{\
          \"shape\":\"ContentEncoding\",\
          \"documentation\":\"<p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Encoding\"\
        },\
        \"ContentLanguage\":{\
          \"shape\":\"ContentLanguage\",\
          \"documentation\":\"<p>The language the content is in.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Language\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the object data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The date and time at which the object is no longer cacheable.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Expires\"\
        },\
        \"GrantFullControl\":{\
          \"shape\":\"GrantFullControl\",\
          \"documentation\":\"<p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-full-control\"\
        },\
        \"GrantRead\":{\
          \"shape\":\"GrantRead\",\
          \"documentation\":\"<p>Allows grantee to read the object data and its metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read\"\
        },\
        \"GrantReadACP\":{\
          \"shape\":\"GrantReadACP\",\
          \"documentation\":\"<p>Allows grantee to read the object ACL.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read-acp\"\
        },\
        \"GrantWriteACP\":{\
          \"shape\":\"GrantWriteACP\",\
          \"documentation\":\"<p>Allows grantee to write the ACL for the applicable object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write-acp\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>A map of metadata to store with the object in S3.</p>\",\
          \"location\":\"headers\",\
          \"locationName\":\"x-amz-meta-\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The type of storage to use for the object. Defaults to 'STANDARD'.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-storage-class\"\
        },\
        \"WebsiteRedirectLocation\":{\
          \"shape\":\"WebsiteRedirectLocation\",\
          \"documentation\":\"<p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-website-redirect-location\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        },\
        \"Tagging\":{\
          \"shape\":\"TaggingHeader\",\
          \"documentation\":\"<p>The tag-set for the object. The tag-set must be encoded as URL Query parameters</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-tagging\"\
        }\
      }\
    },\
    \"CreationDate\":{\"type\":\"timestamp\"},\
    \"Date\":{\
      \"type\":\"timestamp\",\
      \"timestampFormat\":\"iso8601\"\
    },\
    \"Days\":{\"type\":\"integer\"},\
    \"DaysAfterInitiation\":{\"type\":\"integer\"},\
    \"Delete\":{\
      \"type\":\"structure\",\
      \"required\":[\"Objects\"],\
      \"members\":{\
        \"Objects\":{\
          \"shape\":\"ObjectIdentifierList\",\
          \"locationName\":\"Object\"\
        },\
        \"Quiet\":{\
          \"shape\":\"Quiet\",\
          \"documentation\":\"<p>Element to enable quiet mode for the request. When you add this element, you must set its value to true.</p>\"\
        }\
      }\
    },\
    \"DeleteBucketAnalyticsConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket from which an analytics configuration is deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"AnalyticsId\",\
          \"documentation\":\"<p>The identifier used to represent an analytics configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        }\
      }\
    },\
    \"DeleteBucketCorsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketEncryptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the server-side encryption configuration to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketInventoryConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the inventory configuration to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"InventoryId\",\
          \"documentation\":\"<p>The ID used to identify the inventory configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        }\
      }\
    },\
    \"DeleteBucketLifecycleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketMetricsConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the metrics configuration to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"MetricsId\",\
          \"documentation\":\"<p>The ID used to identify the metrics configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        }\
      }\
    },\
    \"DeleteBucketPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketReplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Deletes the replication subresource associated with the specified bucket.</p> <note> <p>There is usually some time lag before replication configuration deletion is fully propagated to all the Amazon S3 systems.</p> </note> <p> For more information, see <a href=\\\" https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html\\\">Cross-Region Replication (CRR)</a> in the Amazon S3 Developer Guide. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketTaggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteBucketWebsiteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"DeleteMarker\":{\"type\":\"boolean\"},\
    \"DeleteMarkerEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Owner\":{\"shape\":\"Owner\"},\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>The object key.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version ID of an object.</p>\"\
        },\
        \"IsLatest\":{\
          \"shape\":\"IsLatest\",\
          \"documentation\":\"<p>Specifies whether the object is (true) or is not (false) the latest version of an object.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>Date and time the object was last modified.</p>\"\
        }\
      }\
    },\
    \"DeleteMarkerReplication\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"DeleteMarkerReplicationStatus\",\
          \"documentation\":\"<p>The status of the delete marker replication.</p> <note> <p> In the current implementation, Amazon S3 does not replicate the delete markers. Therefore, the status must be <code>Disabled</code>. </p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies whether Amazon S3 should replicate delete makers.</p>\"\
    },\
    \"DeleteMarkerReplicationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"DeleteMarkerVersionId\":{\"type\":\"string\"},\
    \"DeleteMarkers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeleteMarkerEntry\"},\
      \"flattened\":true\
    },\
    \"DeleteObjectOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeleteMarker\":{\
          \"shape\":\"DeleteMarker\",\
          \"documentation\":\"<p>Specifies whether the versioned object that was permanently deleted was (true) or was not (false) a delete marker.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-delete-marker\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Returns the version ID of the delete marker created as a result of the DELETE operation.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"DeleteObjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"MFA\":{\
          \"shape\":\"MFA\",\
          \"documentation\":\"<p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mfa\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>VersionId used to reference a specific version of the object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"DeleteObjectTaggingOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>The versionId of the object the tag-set was removed from.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        }\
      }\
    },\
    \"DeleteObjectTaggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>The versionId of the object that the tag-set will be removed from.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        }\
      }\
    },\
    \"DeleteObjectsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Deleted\":{\"shape\":\"DeletedObjects\"},\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        },\
        \"Errors\":{\
          \"shape\":\"Errors\",\
          \"locationName\":\"Error\"\
        }\
      }\
    },\
    \"DeleteObjectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Delete\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Delete\":{\
          \"shape\":\"Delete\",\
          \"locationName\":\"Delete\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"MFA\":{\
          \"shape\":\"MFA\",\
          \"documentation\":\"<p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mfa\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      },\
      \"payload\":\"Delete\"\
    },\
    \"DeletedObject\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\"shape\":\"ObjectKey\"},\
        \"VersionId\":{\"shape\":\"ObjectVersionId\"},\
        \"DeleteMarker\":{\"shape\":\"DeleteMarker\"},\
        \"DeleteMarkerVersionId\":{\"shape\":\"DeleteMarkerVersionId\"}\
      }\
    },\
    \"DeletedObjects\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeletedObject\"},\
      \"flattened\":true\
    },\
    \"Delimiter\":{\"type\":\"string\"},\
    \"Description\":{\"type\":\"string\"},\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p> Amazon resource name (ARN) of the bucket where you want Amazon S3 to store replicas of the object identified by the rule. </p> <p> If you have multiple rules in your replication configuration, all rules must specify the same bucket as the destination. A replication configuration can replicate objects only to one destination bucket. </p>\"\
        },\
        \"Account\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p> Account ID of the destination bucket. Currently Amazon S3 verifies this value only if Access Control Translation is enabled. </p> <p> In a cross-account scenario, if you tell Amazon S3 to change replica ownership to the AWS account that owns the destination bucket by adding the <code>AccessControlTranslation</code> element, this is the account ID of the destination bucket owner. </p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        },\
        \"AccessControlTranslation\":{\
          \"shape\":\"AccessControlTranslation\",\
          \"documentation\":\"<p> Container for information regarding the access control for replicas. </p> <p> Use only in a cross-account scenario, where source and destination bucket owners are not the same, when you want to change replica ownership to the AWS account that owns the destination bucket. If you don't add this element to the replication configuration, the replicas are owned by same AWS account that owns the source object. </p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p> Container that provides encryption-related information. You must specify this element if the <code>SourceSelectionCriteria</code> is specified. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for replication destination information.</p>\"\
    },\
    \"DisplayName\":{\"type\":\"string\"},\
    \"ETag\":{\"type\":\"string\"},\
    \"EmailAddress\":{\"type\":\"string\"},\
    \"EnableRequestProgress\":{\"type\":\"boolean\"},\
    \"EncodingType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.</p>\",\
      \"enum\":[\"url\"]\
    },\
    \"Encryption\":{\
      \"type\":\"structure\",\
      \"required\":[\"EncryptionType\"],\
      \"members\":{\
        \"EncryptionType\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The server-side encryption algorithm used when storing job results in Amazon S3 (e.g., AES256, aws:kms).</p>\"\
        },\
        \"KMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If the encryption type is aws:kms, this optional value specifies the AWS KMS key ID to use for encryption of job results.</p>\"\
        },\
        \"KMSContext\":{\
          \"shape\":\"KMSContext\",\
          \"documentation\":\"<p>If the encryption type is aws:kms, this optional value can be used to specify the encryption context for the restore results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the server-side encryption that will be applied to the restore results.</p>\"\
    },\
    \"EncryptionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicaKmsKeyID\":{\
          \"shape\":\"ReplicaKmsKeyID\",\
          \"documentation\":\"<p> The ID of the AWS KMS key for the region where the destination bucket resides. Amazon S3 uses this key to encrypt the replica object. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for information regarding encryption based configuration for replicas.</p>\"\
    },\
    \"EndEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"event\":true\
    },\
    \"Error\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\"shape\":\"ObjectKey\"},\
        \"VersionId\":{\"shape\":\"ObjectVersionId\"},\
        \"Code\":{\"shape\":\"Code\"},\
        \"Message\":{\"shape\":\"Message\"}\
      }\
    },\
    \"ErrorDocument\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>The object key name to use when a 4XX class error occurs.</p>\"\
        }\
      }\
    },\
    \"Errors\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Error\"},\
      \"flattened\":true\
    },\
    \"Event\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Bucket event for which to send notifications.</p>\",\
      \"enum\":[\
        \"s3:ReducedRedundancyLostObject\",\
        \"s3:ObjectCreated:*\",\
        \"s3:ObjectCreated:Put\",\
        \"s3:ObjectCreated:Post\",\
        \"s3:ObjectCreated:Copy\",\
        \"s3:ObjectCreated:CompleteMultipartUpload\",\
        \"s3:ObjectRemoved:*\",\
        \"s3:ObjectRemoved:Delete\",\
        \"s3:ObjectRemoved:DeleteMarkerCreated\"\
      ]\
    },\
    \"EventList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Event\"},\
      \"flattened\":true\
    },\
    \"Expiration\":{\"type\":\"string\"},\
    \"ExpirationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"ExpiredObjectDeleteMarker\":{\"type\":\"boolean\"},\
    \"Expires\":{\"type\":\"timestamp\"},\
    \"ExposeHeader\":{\"type\":\"string\"},\
    \"ExposeHeaders\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExposeHeader\"},\
      \"flattened\":true\
    },\
    \"Expression\":{\"type\":\"string\"},\
    \"ExpressionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"SQL\"]\
    },\
    \"FetchOwner\":{\"type\":\"boolean\"},\
    \"FieldDelimiter\":{\"type\":\"string\"},\
    \"FileHeaderInfo\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USE\",\
        \"IGNORE\",\
        \"NONE\"\
      ]\
    },\
    \"FilterRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"FilterRuleName\",\
          \"documentation\":\"<p>Object key name prefix or suffix identifying one or more objects to which the filtering rule applies. Maximum prefix length can be up to 1,024 characters. Overlapping prefixes and suffixes are not supported. For more information, go to <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html\\\">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.</p>\"\
        },\
        \"Value\":{\"shape\":\"FilterRuleValue\"}\
      },\
      \"documentation\":\"<p>Container for key value pair that defines the criteria for the filter rule.</p>\"\
    },\
    \"FilterRuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilterRule\"},\
      \"documentation\":\"<p>A list of containers for key value pair that defines the criteria for the filter rule.</p>\",\
      \"flattened\":true\
    },\
    \"FilterRuleName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"prefix\",\
        \"suffix\"\
      ]\
    },\
    \"FilterRuleValue\":{\"type\":\"string\"},\
    \"GetBucketAccelerateConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"BucketAccelerateStatus\",\
          \"documentation\":\"<p>The accelerate configuration of the bucket.</p>\"\
        }\
      }\
    },\
    \"GetBucketAccelerateConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket for which the accelerate configuration is retrieved.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketAclOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Owner\":{\"shape\":\"Owner\"},\
        \"Grants\":{\
          \"shape\":\"Grants\",\
          \"documentation\":\"<p>A list of grants.</p>\",\
          \"locationName\":\"AccessControlList\"\
        }\
      }\
    },\
    \"GetBucketAclRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketAnalyticsConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AnalyticsConfiguration\":{\
          \"shape\":\"AnalyticsConfiguration\",\
          \"documentation\":\"<p>The configuration and any analyses for the analytics filter.</p>\"\
        }\
      },\
      \"payload\":\"AnalyticsConfiguration\"\
    },\
    \"GetBucketAnalyticsConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket from which an analytics configuration is retrieved.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"AnalyticsId\",\
          \"documentation\":\"<p>The identifier used to represent an analytics configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        }\
      }\
    },\
    \"GetBucketCorsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CORSRules\":{\
          \"shape\":\"CORSRules\",\
          \"locationName\":\"CORSRule\"\
        }\
      }\
    },\
    \"GetBucketCorsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketEncryptionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServerSideEncryptionConfiguration\":{\"shape\":\"ServerSideEncryptionConfiguration\"}\
      },\
      \"payload\":\"ServerSideEncryptionConfiguration\"\
    },\
    \"GetBucketEncryptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket from which the server-side encryption configuration is retrieved.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketInventoryConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InventoryConfiguration\":{\
          \"shape\":\"InventoryConfiguration\",\
          \"documentation\":\"<p>Specifies the inventory configuration.</p>\"\
        }\
      },\
      \"payload\":\"InventoryConfiguration\"\
    },\
    \"GetBucketInventoryConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the inventory configuration to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"InventoryId\",\
          \"documentation\":\"<p>The ID used to identify the inventory configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        }\
      }\
    },\
    \"GetBucketLifecycleConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"LifecycleRules\",\
          \"locationName\":\"Rule\"\
        }\
      }\
    },\
    \"GetBucketLifecycleConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketLifecycleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"Rules\",\
          \"locationName\":\"Rule\"\
        }\
      }\
    },\
    \"GetBucketLifecycleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketLocationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LocationConstraint\":{\"shape\":\"BucketLocationConstraint\"}\
      }\
    },\
    \"GetBucketLocationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketLoggingOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoggingEnabled\":{\"shape\":\"LoggingEnabled\"}\
      }\
    },\
    \"GetBucketLoggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketMetricsConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricsConfiguration\":{\
          \"shape\":\"MetricsConfiguration\",\
          \"documentation\":\"<p>Specifies the metrics configuration.</p>\"\
        }\
      },\
      \"payload\":\"MetricsConfiguration\"\
    },\
    \"GetBucketMetricsConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the metrics configuration to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"MetricsId\",\
          \"documentation\":\"<p>The ID used to identify the metrics configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        }\
      }\
    },\
    \"GetBucketNotificationConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to get the notification configuration for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The bucket policy as a JSON document.</p>\"\
        }\
      },\
      \"payload\":\"Policy\"\
    },\
    \"GetBucketPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketReplicationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationConfiguration\":{\"shape\":\"ReplicationConfiguration\"}\
      },\
      \"payload\":\"ReplicationConfiguration\"\
    },\
    \"GetBucketReplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketRequestPaymentOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Payer\":{\
          \"shape\":\"Payer\",\
          \"documentation\":\"<p>Specifies who pays for the download and request fees.</p>\"\
        }\
      }\
    },\
    \"GetBucketRequestPaymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketTaggingOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TagSet\"],\
      \"members\":{\
        \"TagSet\":{\"shape\":\"TagSet\"}\
      }\
    },\
    \"GetBucketTaggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketVersioningOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"BucketVersioningStatus\",\
          \"documentation\":\"<p>The versioning state of the bucket.</p>\"\
        },\
        \"MFADelete\":{\
          \"shape\":\"MFADeleteStatus\",\
          \"documentation\":\"<p>Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.</p>\",\
          \"locationName\":\"MfaDelete\"\
        }\
      }\
    },\
    \"GetBucketVersioningRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetBucketWebsiteOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RedirectAllRequestsTo\":{\"shape\":\"RedirectAllRequestsTo\"},\
        \"IndexDocument\":{\"shape\":\"IndexDocument\"},\
        \"ErrorDocument\":{\"shape\":\"ErrorDocument\"},\
        \"RoutingRules\":{\"shape\":\"RoutingRules\"}\
      }\
    },\
    \"GetBucketWebsiteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"GetObjectAclOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Owner\":{\"shape\":\"Owner\"},\
        \"Grants\":{\
          \"shape\":\"Grants\",\
          \"documentation\":\"<p>A list of grants.</p>\",\
          \"locationName\":\"AccessControlList\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"GetObjectAclRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>VersionId used to reference a specific version of the object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"GetObjectOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Body\":{\
          \"shape\":\"Body\",\
          \"documentation\":\"<p>Object data.</p>\",\
          \"streaming\":true\
        },\
        \"DeleteMarker\":{\
          \"shape\":\"DeleteMarker\",\
          \"documentation\":\"<p>Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-delete-marker\"\
        },\
        \"AcceptRanges\":{\
          \"shape\":\"AcceptRanges\",\
          \"location\":\"header\",\
          \"locationName\":\"accept-ranges\"\
        },\
        \"Expiration\":{\
          \"shape\":\"Expiration\",\
          \"documentation\":\"<p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key value pairs providing object expiration information. The value of the rule-id is URL encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-expiration\"\
        },\
        \"Restore\":{\
          \"shape\":\"Restore\",\
          \"documentation\":\"<p>Provides information about object restoration operation and expiration time of the restored object copy.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-restore\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>Last modified date of the object</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Last-Modified\"\
        },\
        \"ContentLength\":{\
          \"shape\":\"ContentLength\",\
          \"documentation\":\"<p>Size of the body in bytes.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Length\"\
        },\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"ETag\"\
        },\
        \"MissingMeta\":{\
          \"shape\":\"MissingMeta\",\
          \"documentation\":\"<p>This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-missing-meta\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version of the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"CacheControl\":{\
          \"shape\":\"CacheControl\",\
          \"documentation\":\"<p>Specifies caching behavior along the request/reply chain.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Cache-Control\"\
        },\
        \"ContentDisposition\":{\
          \"shape\":\"ContentDisposition\",\
          \"documentation\":\"<p>Specifies presentational information for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Disposition\"\
        },\
        \"ContentEncoding\":{\
          \"shape\":\"ContentEncoding\",\
          \"documentation\":\"<p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Encoding\"\
        },\
        \"ContentLanguage\":{\
          \"shape\":\"ContentLanguage\",\
          \"documentation\":\"<p>The language the content is in.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Language\"\
        },\
        \"ContentRange\":{\
          \"shape\":\"ContentRange\",\
          \"documentation\":\"<p>The portion of the object returned in the response.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Range\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the object data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The date and time at which the object is no longer cacheable.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Expires\"\
        },\
        \"WebsiteRedirectLocation\":{\
          \"shape\":\"WebsiteRedirectLocation\",\
          \"documentation\":\"<p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-website-redirect-location\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>A map of metadata to store with the object in S3.</p>\",\
          \"location\":\"headers\",\
          \"locationName\":\"x-amz-meta-\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-storage-class\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        },\
        \"ReplicationStatus\":{\
          \"shape\":\"ReplicationStatus\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-replication-status\"\
        },\
        \"PartsCount\":{\
          \"shape\":\"PartsCount\",\
          \"documentation\":\"<p>The count of parts this object has.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mp-parts-count\"\
        },\
        \"TagCount\":{\
          \"shape\":\"TagCount\",\
          \"documentation\":\"<p>The number of tags, if any, on the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-tagging-count\"\
        }\
      },\
      \"payload\":\"Body\"\
    },\
    \"GetObjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"IfMatch\":{\
          \"shape\":\"IfMatch\",\
          \"documentation\":\"<p>Return the object only if its entity tag (ETag) is the same as the one specified, otherwise return a 412 (precondition failed).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-Match\"\
        },\
        \"IfModifiedSince\":{\
          \"shape\":\"IfModifiedSince\",\
          \"documentation\":\"<p>Return the object only if it has been modified since the specified time, otherwise return a 304 (not modified).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-Modified-Since\"\
        },\
        \"IfNoneMatch\":{\
          \"shape\":\"IfNoneMatch\",\
          \"documentation\":\"<p>Return the object only if its entity tag (ETag) is different from the one specified, otherwise return a 304 (not modified).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-None-Match\"\
        },\
        \"IfUnmodifiedSince\":{\
          \"shape\":\"IfUnmodifiedSince\",\
          \"documentation\":\"<p>Return the object only if it has not been modified since the specified time, otherwise return a 412 (precondition failed).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-Unmodified-Since\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"Range\":{\
          \"shape\":\"Range\",\
          \"documentation\":\"<p>Downloads the specified range bytes of an object. For more information about the HTTP Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Range\"\
        },\
        \"ResponseCacheControl\":{\
          \"shape\":\"ResponseCacheControl\",\
          \"documentation\":\"<p>Sets the Cache-Control header of the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"response-cache-control\"\
        },\
        \"ResponseContentDisposition\":{\
          \"shape\":\"ResponseContentDisposition\",\
          \"documentation\":\"<p>Sets the Content-Disposition header of the response</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"response-content-disposition\"\
        },\
        \"ResponseContentEncoding\":{\
          \"shape\":\"ResponseContentEncoding\",\
          \"documentation\":\"<p>Sets the Content-Encoding header of the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"response-content-encoding\"\
        },\
        \"ResponseContentLanguage\":{\
          \"shape\":\"ResponseContentLanguage\",\
          \"documentation\":\"<p>Sets the Content-Language header of the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"response-content-language\"\
        },\
        \"ResponseContentType\":{\
          \"shape\":\"ResponseContentType\",\
          \"documentation\":\"<p>Sets the Content-Type header of the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"response-content-type\"\
        },\
        \"ResponseExpires\":{\
          \"shape\":\"ResponseExpires\",\
          \"documentation\":\"<p>Sets the Expires header of the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"response-expires\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>VersionId used to reference a specific version of the object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        },\
        \"PartNumber\":{\
          \"shape\":\"PartNumber\",\
          \"documentation\":\"<p>Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' GET request for the part specified. Useful for downloading just a part of an object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"partNumber\"\
        }\
      }\
    },\
    \"GetObjectTaggingOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TagSet\"],\
      \"members\":{\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"TagSet\":{\"shape\":\"TagSet\"}\
      }\
    },\
    \"GetObjectTaggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        }\
      }\
    },\
    \"GetObjectTorrentOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Body\":{\
          \"shape\":\"Body\",\
          \"streaming\":true\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      },\
      \"payload\":\"Body\"\
    },\
    \"GetObjectTorrentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"GlacierJobParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"Tier\"],\
      \"members\":{\
        \"Tier\":{\
          \"shape\":\"Tier\",\
          \"documentation\":\"<p>Glacier retrieval tier at which the restore will be processed.</p>\"\
        }\
      }\
    },\
    \"Grant\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Grantee\":{\"shape\":\"Grantee\"},\
        \"Permission\":{\
          \"shape\":\"Permission\",\
          \"documentation\":\"<p>Specifies the permission given to the grantee.</p>\"\
        }\
      }\
    },\
    \"GrantFullControl\":{\"type\":\"string\"},\
    \"GrantRead\":{\"type\":\"string\"},\
    \"GrantReadACP\":{\"type\":\"string\"},\
    \"GrantWrite\":{\"type\":\"string\"},\
    \"GrantWriteACP\":{\"type\":\"string\"},\
    \"Grantee\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"DisplayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p>Screen name of the grantee.</p>\"\
        },\
        \"EmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>Email address of the grantee.</p>\"\
        },\
        \"ID\":{\
          \"shape\":\"ID\",\
          \"documentation\":\"<p>The canonical user ID of the grantee.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>Type of grantee</p>\",\
          \"locationName\":\"xsi:type\",\
          \"xmlAttribute\":true\
        },\
        \"URI\":{\
          \"shape\":\"URI\",\
          \"documentation\":\"<p>URI of the grantee group.</p>\"\
        }\
      },\
      \"xmlNamespace\":{\
        \"prefix\":\"xsi\",\
        \"uri\":\"http://www.w3.org/2001/XMLSchema-instance\"\
      }\
    },\
    \"Grants\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Grant\",\
        \"locationName\":\"Grant\"\
      }\
    },\
    \"HeadBucketRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        }\
      }\
    },\
    \"HeadObjectOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeleteMarker\":{\
          \"shape\":\"DeleteMarker\",\
          \"documentation\":\"<p>Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-delete-marker\"\
        },\
        \"AcceptRanges\":{\
          \"shape\":\"AcceptRanges\",\
          \"location\":\"header\",\
          \"locationName\":\"accept-ranges\"\
        },\
        \"Expiration\":{\
          \"shape\":\"Expiration\",\
          \"documentation\":\"<p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key value pairs providing object expiration information. The value of the rule-id is URL encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-expiration\"\
        },\
        \"Restore\":{\
          \"shape\":\"Restore\",\
          \"documentation\":\"<p>Provides information about object restoration operation and expiration time of the restored object copy.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-restore\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>Last modified date of the object</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Last-Modified\"\
        },\
        \"ContentLength\":{\
          \"shape\":\"ContentLength\",\
          \"documentation\":\"<p>Size of the body in bytes.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Length\"\
        },\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"ETag\"\
        },\
        \"MissingMeta\":{\
          \"shape\":\"MissingMeta\",\
          \"documentation\":\"<p>This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-missing-meta\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version of the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"CacheControl\":{\
          \"shape\":\"CacheControl\",\
          \"documentation\":\"<p>Specifies caching behavior along the request/reply chain.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Cache-Control\"\
        },\
        \"ContentDisposition\":{\
          \"shape\":\"ContentDisposition\",\
          \"documentation\":\"<p>Specifies presentational information for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Disposition\"\
        },\
        \"ContentEncoding\":{\
          \"shape\":\"ContentEncoding\",\
          \"documentation\":\"<p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Encoding\"\
        },\
        \"ContentLanguage\":{\
          \"shape\":\"ContentLanguage\",\
          \"documentation\":\"<p>The language the content is in.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Language\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the object data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The date and time at which the object is no longer cacheable.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Expires\"\
        },\
        \"WebsiteRedirectLocation\":{\
          \"shape\":\"WebsiteRedirectLocation\",\
          \"documentation\":\"<p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-website-redirect-location\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>A map of metadata to store with the object in S3.</p>\",\
          \"location\":\"headers\",\
          \"locationName\":\"x-amz-meta-\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-storage-class\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        },\
        \"ReplicationStatus\":{\
          \"shape\":\"ReplicationStatus\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-replication-status\"\
        },\
        \"PartsCount\":{\
          \"shape\":\"PartsCount\",\
          \"documentation\":\"<p>The count of parts this object has.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mp-parts-count\"\
        }\
      }\
    },\
    \"HeadObjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"IfMatch\":{\
          \"shape\":\"IfMatch\",\
          \"documentation\":\"<p>Return the object only if its entity tag (ETag) is the same as the one specified, otherwise return a 412 (precondition failed).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-Match\"\
        },\
        \"IfModifiedSince\":{\
          \"shape\":\"IfModifiedSince\",\
          \"documentation\":\"<p>Return the object only if it has been modified since the specified time, otherwise return a 304 (not modified).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-Modified-Since\"\
        },\
        \"IfNoneMatch\":{\
          \"shape\":\"IfNoneMatch\",\
          \"documentation\":\"<p>Return the object only if its entity tag (ETag) is different from the one specified, otherwise return a 304 (not modified).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-None-Match\"\
        },\
        \"IfUnmodifiedSince\":{\
          \"shape\":\"IfUnmodifiedSince\",\
          \"documentation\":\"<p>Return the object only if it has not been modified since the specified time, otherwise return a 412 (precondition failed).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"If-Unmodified-Since\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"Range\":{\
          \"shape\":\"Range\",\
          \"documentation\":\"<p>Downloads the specified range bytes of an object. For more information about the HTTP Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Range\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>VersionId used to reference a specific version of the object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        },\
        \"PartNumber\":{\
          \"shape\":\"PartNumber\",\
          \"documentation\":\"<p>Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' HEAD request for the part specified. Useful querying about the size of the part and the number of parts in this object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"partNumber\"\
        }\
      }\
    },\
    \"HostName\":{\"type\":\"string\"},\
    \"HttpErrorCodeReturnedEquals\":{\"type\":\"string\"},\
    \"HttpRedirectCode\":{\"type\":\"string\"},\
    \"ID\":{\"type\":\"string\"},\
    \"IfMatch\":{\"type\":\"string\"},\
    \"IfModifiedSince\":{\"type\":\"timestamp\"},\
    \"IfNoneMatch\":{\"type\":\"string\"},\
    \"IfUnmodifiedSince\":{\"type\":\"timestamp\"},\
    \"IndexDocument\":{\
      \"type\":\"structure\",\
      \"required\":[\"Suffix\"],\
      \"members\":{\
        \"Suffix\":{\
          \"shape\":\"Suffix\",\
          \"documentation\":\"<p>A suffix that is appended to a request that is for a directory on the website endpoint (e.g. if the suffix is index.html and you make a request to samplebucket/images/ the data that is returned will be for the object with the key name images/index.html) The suffix must not be empty and must not include a slash character.</p>\"\
        }\
      }\
    },\
    \"Initiated\":{\"type\":\"timestamp\"},\
    \"Initiator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ID\":{\
          \"shape\":\"ID\",\
          \"documentation\":\"<p>If the principal is an AWS account, it provides the Canonical User ID. If the principal is an IAM User, it provides a user ARN value.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p>Name of the Principal.</p>\"\
        }\
      }\
    },\
    \"InputSerialization\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CSV\":{\
          \"shape\":\"CSVInput\",\
          \"documentation\":\"<p>Describes the serialization of a CSV-encoded object.</p>\"\
        },\
        \"CompressionType\":{\
          \"shape\":\"CompressionType\",\
          \"documentation\":\"<p>Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value: NONE.</p>\"\
        },\
        \"JSON\":{\
          \"shape\":\"JSONInput\",\
          \"documentation\":\"<p>Specifies JSON as object's input serialization format.</p>\"\
        },\
        \"Parquet\":{\
          \"shape\":\"ParquetInput\",\
          \"documentation\":\"<p>Specifies Parquet as object's input serialization format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the serialization format of the object.</p>\"\
    },\
    \"InventoryConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Destination\",\
        \"IsEnabled\",\
        \"Id\",\
        \"IncludedObjectVersions\",\
        \"Schedule\"\
      ],\
      \"members\":{\
        \"Destination\":{\
          \"shape\":\"InventoryDestination\",\
          \"documentation\":\"<p>Contains information about where to publish the inventory results.</p>\"\
        },\
        \"IsEnabled\":{\
          \"shape\":\"IsEnabled\",\
          \"documentation\":\"<p>Specifies whether the inventory is enabled or disabled.</p>\"\
        },\
        \"Filter\":{\
          \"shape\":\"InventoryFilter\",\
          \"documentation\":\"<p>Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"InventoryId\",\
          \"documentation\":\"<p>The ID used to identify the inventory configuration.</p>\"\
        },\
        \"IncludedObjectVersions\":{\
          \"shape\":\"InventoryIncludedObjectVersions\",\
          \"documentation\":\"<p>Specifies which object version(s) to included in the inventory results.</p>\"\
        },\
        \"OptionalFields\":{\
          \"shape\":\"InventoryOptionalFields\",\
          \"documentation\":\"<p>Contains the optional fields that are included in the inventory results.</p>\"\
        },\
        \"Schedule\":{\
          \"shape\":\"InventorySchedule\",\
          \"documentation\":\"<p>Specifies the schedule for generating inventory results.</p>\"\
        }\
      }\
    },\
    \"InventoryConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InventoryConfiguration\"},\
      \"flattened\":true\
    },\
    \"InventoryDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3BucketDestination\"],\
      \"members\":{\
        \"S3BucketDestination\":{\
          \"shape\":\"InventoryS3BucketDestination\",\
          \"documentation\":\"<p>Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where inventory results are published.</p>\"\
        }\
      }\
    },\
    \"InventoryEncryption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SSES3\":{\
          \"shape\":\"SSES3\",\
          \"documentation\":\"<p>Specifies the use of SSE-S3 to encrypt delievered Inventory reports.</p>\",\
          \"locationName\":\"SSE-S3\"\
        },\
        \"SSEKMS\":{\
          \"shape\":\"SSEKMS\",\
          \"documentation\":\"<p>Specifies the use of SSE-KMS to encrypt delievered Inventory reports.</p>\",\
          \"locationName\":\"SSE-KMS\"\
        }\
      },\
      \"documentation\":\"<p>Contains the type of server-side encryption used to encrypt the inventory results.</p>\"\
    },\
    \"InventoryFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\"Prefix\"],\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix that an object must have to be included in the inventory results.</p>\"\
        }\
      }\
    },\
    \"InventoryFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CSV\",\
        \"ORC\"\
      ]\
    },\
    \"InventoryFrequency\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Daily\",\
        \"Weekly\"\
      ]\
    },\
    \"InventoryId\":{\"type\":\"string\"},\
    \"InventoryIncludedObjectVersions\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"All\",\
        \"Current\"\
      ]\
    },\
    \"InventoryOptionalField\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Size\",\
        \"LastModifiedDate\",\
        \"StorageClass\",\
        \"ETag\",\
        \"IsMultipartUploaded\",\
        \"ReplicationStatus\",\
        \"EncryptionStatus\"\
      ]\
    },\
    \"InventoryOptionalFields\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InventoryOptionalField\",\
        \"locationName\":\"Field\"\
      }\
    },\
    \"InventoryS3BucketDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Format\"\
      ],\
      \"members\":{\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The ID of the account that owns the destination bucket.</p>\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The Amazon resource name (ARN) of the bucket where inventory results will be published.</p>\"\
        },\
        \"Format\":{\
          \"shape\":\"InventoryFormat\",\
          \"documentation\":\"<p>Specifies the output format of the inventory results.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix that is prepended to all inventory results.</p>\"\
        },\
        \"Encryption\":{\
          \"shape\":\"InventoryEncryption\",\
          \"documentation\":\"<p>Contains the type of server-side encryption used to encrypt the inventory results.</p>\"\
        }\
      }\
    },\
    \"InventorySchedule\":{\
      \"type\":\"structure\",\
      \"required\":[\"Frequency\"],\
      \"members\":{\
        \"Frequency\":{\
          \"shape\":\"InventoryFrequency\",\
          \"documentation\":\"<p>Specifies how frequently inventory results are produced.</p>\"\
        }\
      }\
    },\
    \"IsEnabled\":{\"type\":\"boolean\"},\
    \"IsLatest\":{\"type\":\"boolean\"},\
    \"IsTruncated\":{\"type\":\"boolean\"},\
    \"JSONInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"JSONType\",\
          \"documentation\":\"<p>The type of JSON. Valid values: Document, Lines.</p>\"\
        }\
      }\
    },\
    \"JSONOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecordDelimiter\":{\
          \"shape\":\"RecordDelimiter\",\
          \"documentation\":\"<p>The value used to separate individual records in the output.</p>\"\
        }\
      }\
    },\
    \"JSONType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DOCUMENT\",\
        \"LINES\"\
      ]\
    },\
    \"KMSContext\":{\"type\":\"string\"},\
    \"KeyCount\":{\"type\":\"integer\"},\
    \"KeyMarker\":{\"type\":\"string\"},\
    \"KeyPrefixEquals\":{\"type\":\"string\"},\
    \"LambdaFunctionArn\":{\"type\":\"string\"},\
    \"LambdaFunctionConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LambdaFunctionArn\",\
        \"Events\"\
      ],\
      \"members\":{\
        \"Id\":{\"shape\":\"NotificationId\"},\
        \"LambdaFunctionArn\":{\
          \"shape\":\"LambdaFunctionArn\",\
          \"documentation\":\"<p>Lambda cloud function ARN that Amazon S3 can invoke when it detects events of the specified type.</p>\",\
          \"locationName\":\"CloudFunction\"\
        },\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"locationName\":\"Event\"\
        },\
        \"Filter\":{\"shape\":\"NotificationConfigurationFilter\"}\
      },\
      \"documentation\":\"<p>Container for specifying the AWS Lambda notification configuration.</p>\"\
    },\
    \"LambdaFunctionConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LambdaFunctionConfiguration\"},\
      \"flattened\":true\
    },\
    \"LastModified\":{\"type\":\"timestamp\"},\
    \"LifecycleConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Rules\"],\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"Rules\",\
          \"locationName\":\"Rule\"\
        }\
      }\
    },\
    \"LifecycleExpiration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Date\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.</p>\"\
        },\
        \"Days\":{\
          \"shape\":\"Days\",\
          \"documentation\":\"<p>Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.</p>\"\
        },\
        \"ExpiredObjectDeleteMarker\":{\
          \"shape\":\"ExpiredObjectDeleteMarker\",\
          \"documentation\":\"<p>Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action. This cannot be specified with Days or Date in a Lifecycle Expiration Policy.</p>\"\
        }\
      }\
    },\
    \"LifecycleRule\":{\
      \"type\":\"structure\",\
      \"required\":[\"Status\"],\
      \"members\":{\
        \"Expiration\":{\"shape\":\"LifecycleExpiration\"},\
        \"ID\":{\
          \"shape\":\"ID\",\
          \"documentation\":\"<p>Unique identifier for the rule. The value cannot be longer than 255 characters.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Prefix identifying one or more objects to which the rule applies. This is deprecated; use Filter instead.</p>\",\
          \"deprecated\":true\
        },\
        \"Filter\":{\"shape\":\"LifecycleRuleFilter\"},\
        \"Status\":{\
          \"shape\":\"ExpirationStatus\",\
          \"documentation\":\"<p>If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.</p>\"\
        },\
        \"Transitions\":{\
          \"shape\":\"TransitionList\",\
          \"locationName\":\"Transition\"\
        },\
        \"NoncurrentVersionTransitions\":{\
          \"shape\":\"NoncurrentVersionTransitionList\",\
          \"locationName\":\"NoncurrentVersionTransition\"\
        },\
        \"NoncurrentVersionExpiration\":{\"shape\":\"NoncurrentVersionExpiration\"},\
        \"AbortIncompleteMultipartUpload\":{\"shape\":\"AbortIncompleteMultipartUpload\"}\
      }\
    },\
    \"LifecycleRuleAndOperator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\"shape\":\"Prefix\"},\
        \"Tags\":{\
          \"shape\":\"TagSet\",\
          \"documentation\":\"<p>All of these tags must exist in the object's tag set in order for the rule to apply.</p>\",\
          \"flattened\":true,\
          \"locationName\":\"Tag\"\
        }\
      },\
      \"documentation\":\"<p>This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.</p>\"\
    },\
    \"LifecycleRuleFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Prefix identifying one or more objects to which the rule applies.</p>\"\
        },\
        \"Tag\":{\
          \"shape\":\"Tag\",\
          \"documentation\":\"<p>This tag must exist in the object's tag set in order for the rule to apply.</p>\"\
        },\
        \"And\":{\"shape\":\"LifecycleRuleAndOperator\"}\
      },\
      \"documentation\":\"<p>The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.</p>\"\
    },\
    \"LifecycleRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LifecycleRule\"},\
      \"flattened\":true\
    },\
    \"ListBucketAnalyticsConfigurationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>Indicates whether the returned list of analytics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.</p>\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The ContinuationToken that represents where this request began.</p>\"\
        },\
        \"NextContinuationToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>NextContinuationToken is sent when isTruncated is true, which indicates that there are more analytics configurations to list. The next request must include this NextContinuationToken. The token is obfuscated and is not a usable value.</p>\"\
        },\
        \"AnalyticsConfigurationList\":{\
          \"shape\":\"AnalyticsConfigurationList\",\
          \"documentation\":\"<p>The list of analytics configurations for a bucket.</p>\",\
          \"locationName\":\"AnalyticsConfiguration\"\
        }\
      }\
    },\
    \"ListBucketAnalyticsConfigurationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket from which analytics configurations are retrieved.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The ContinuationToken that represents a placeholder from where this request should begin.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"continuation-token\"\
        }\
      }\
    },\
    \"ListBucketInventoryConfigurationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>If sent in the request, the marker that is used as a starting point for this inventory configuration list response.</p>\"\
        },\
        \"InventoryConfigurationList\":{\
          \"shape\":\"InventoryConfigurationList\",\
          \"documentation\":\"<p>The list of inventory configurations for a bucket.</p>\",\
          \"locationName\":\"InventoryConfiguration\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>Indicates whether the returned list of inventory configurations is truncated in this response. A value of true indicates that the list is truncated.</p>\"\
        },\
        \"NextContinuationToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The marker used to continue this inventory configuration listing. Use the NextContinuationToken from this response to continue the listing in a subsequent request. The continuation token is an opaque value that Amazon S3 understands.</p>\"\
        }\
      }\
    },\
    \"ListBucketInventoryConfigurationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the inventory configurations to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The marker used to continue an inventory configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"continuation-token\"\
        }\
      }\
    },\
    \"ListBucketMetricsConfigurationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>Indicates whether the returned list of metrics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.</p>\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The marker that is used as a starting point for this metrics configuration list response. This value is present if it was sent in the request.</p>\"\
        },\
        \"NextContinuationToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The marker used to continue a metrics configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>\"\
        },\
        \"MetricsConfigurationList\":{\
          \"shape\":\"MetricsConfigurationList\",\
          \"documentation\":\"<p>The list of metrics configurations for a bucket.</p>\",\
          \"locationName\":\"MetricsConfiguration\"\
        }\
      }\
    },\
    \"ListBucketMetricsConfigurationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket containing the metrics configurations to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The marker that is used to continue a metrics configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"continuation-token\"\
        }\
      }\
    },\
    \"ListBucketsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Buckets\":{\"shape\":\"Buckets\"},\
        \"Owner\":{\"shape\":\"Owner\"}\
      }\
    },\
    \"ListMultipartUploadsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to which the multipart upload was initiated.</p>\"\
        },\
        \"KeyMarker\":{\
          \"shape\":\"KeyMarker\",\
          \"documentation\":\"<p>The key at or after which the listing began.</p>\"\
        },\
        \"UploadIdMarker\":{\
          \"shape\":\"UploadIdMarker\",\
          \"documentation\":\"<p>Upload ID after which listing began.</p>\"\
        },\
        \"NextKeyMarker\":{\
          \"shape\":\"NextKeyMarker\",\
          \"documentation\":\"<p>When a list is truncated, this element specifies the value that should be used for the key-marker request parameter in a subsequent request.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>When a prefix is provided in the request, this field contains the specified prefix. The result contains only keys starting with the specified prefix.</p>\"\
        },\
        \"Delimiter\":{\"shape\":\"Delimiter\"},\
        \"NextUploadIdMarker\":{\
          \"shape\":\"NextUploadIdMarker\",\
          \"documentation\":\"<p>When a list is truncated, this element specifies the value that should be used for the upload-id-marker request parameter in a subsequent request.</p>\"\
        },\
        \"MaxUploads\":{\
          \"shape\":\"MaxUploads\",\
          \"documentation\":\"<p>Maximum number of multipart uploads that could have been included in the response.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>Indicates whether the returned list of multipart uploads is truncated. A value of true indicates that the list was truncated. The list can be truncated if the number of multipart uploads exceeds the limit allowed or specified by max uploads.</p>\"\
        },\
        \"Uploads\":{\
          \"shape\":\"MultipartUploadList\",\
          \"locationName\":\"Upload\"\
        },\
        \"CommonPrefixes\":{\"shape\":\"CommonPrefixList\"},\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"documentation\":\"<p>Encoding type used by Amazon S3 to encode object keys in the response.</p>\"\
        }\
      }\
    },\
    \"ListMultipartUploadsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Delimiter\":{\
          \"shape\":\"Delimiter\",\
          \"documentation\":\"<p>Character you use to group keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"delimiter\"\
        },\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"location\":\"querystring\",\
          \"locationName\":\"encoding-type\"\
        },\
        \"KeyMarker\":{\
          \"shape\":\"KeyMarker\",\
          \"documentation\":\"<p>Together with upload-id-marker, this parameter specifies the multipart upload after which listing should begin.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"key-marker\"\
        },\
        \"MaxUploads\":{\
          \"shape\":\"MaxUploads\",\
          \"documentation\":\"<p>Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response body. 1,000 is the maximum number of uploads that can be returned in a response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-uploads\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Lists in-progress uploads only for those keys that begin with the specified prefix.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"prefix\"\
        },\
        \"UploadIdMarker\":{\
          \"shape\":\"UploadIdMarker\",\
          \"documentation\":\"<p>Together with key-marker, specifies the multipart upload after which listing should begin. If key-marker is not specified, the upload-id-marker parameter is ignored.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"upload-id-marker\"\
        }\
      }\
    },\
    \"ListObjectVersionsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria. If your results were truncated, you can make a follow-up paginated request using the NextKeyMarker and NextVersionIdMarker response parameters as a starting place in another request to return the rest of the results.</p>\"\
        },\
        \"KeyMarker\":{\
          \"shape\":\"KeyMarker\",\
          \"documentation\":\"<p>Marks the last Key returned in a truncated response.</p>\"\
        },\
        \"VersionIdMarker\":{\"shape\":\"VersionIdMarker\"},\
        \"NextKeyMarker\":{\
          \"shape\":\"NextKeyMarker\",\
          \"documentation\":\"<p>Use this value for the key marker request parameter in a subsequent request.</p>\"\
        },\
        \"NextVersionIdMarker\":{\
          \"shape\":\"NextVersionIdMarker\",\
          \"documentation\":\"<p>Use this value for the next version id marker parameter in a subsequent request.</p>\"\
        },\
        \"Versions\":{\
          \"shape\":\"ObjectVersionList\",\
          \"locationName\":\"Version\"\
        },\
        \"DeleteMarkers\":{\
          \"shape\":\"DeleteMarkers\",\
          \"locationName\":\"DeleteMarker\"\
        },\
        \"Name\":{\"shape\":\"BucketName\"},\
        \"Prefix\":{\"shape\":\"Prefix\"},\
        \"Delimiter\":{\"shape\":\"Delimiter\"},\
        \"MaxKeys\":{\"shape\":\"MaxKeys\"},\
        \"CommonPrefixes\":{\"shape\":\"CommonPrefixList\"},\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"documentation\":\"<p>Encoding type used by Amazon S3 to encode object keys in the response.</p>\"\
        }\
      }\
    },\
    \"ListObjectVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Delimiter\":{\
          \"shape\":\"Delimiter\",\
          \"documentation\":\"<p>A delimiter is a character you use to group keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"delimiter\"\
        },\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"location\":\"querystring\",\
          \"locationName\":\"encoding-type\"\
        },\
        \"KeyMarker\":{\
          \"shape\":\"KeyMarker\",\
          \"documentation\":\"<p>Specifies the key to start with when listing objects in a bucket.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"key-marker\"\
        },\
        \"MaxKeys\":{\
          \"shape\":\"MaxKeys\",\
          \"documentation\":\"<p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-keys\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Limits the response to keys that begin with the specified prefix.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"prefix\"\
        },\
        \"VersionIdMarker\":{\
          \"shape\":\"VersionIdMarker\",\
          \"documentation\":\"<p>Specifies the object version you want to start listing from.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version-id-marker\"\
        }\
      }\
    },\
    \"ListObjectsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria.</p>\"\
        },\
        \"Marker\":{\"shape\":\"Marker\"},\
        \"NextMarker\":{\
          \"shape\":\"NextMarker\",\
          \"documentation\":\"<p>When response is truncated (the IsTruncated element value in the response is true), you can use the key name in this field as marker in the subsequent request to get next set of objects. Amazon S3 lists objects in alphabetical order Note: This element is returned only if you have delimiter request parameter specified. If response does not include the NextMaker and it is truncated, you can use the value of the last Key in the response as the marker in the subsequent request to get the next set of object keys.</p>\"\
        },\
        \"Contents\":{\"shape\":\"ObjectList\"},\
        \"Name\":{\"shape\":\"BucketName\"},\
        \"Prefix\":{\"shape\":\"Prefix\"},\
        \"Delimiter\":{\"shape\":\"Delimiter\"},\
        \"MaxKeys\":{\"shape\":\"MaxKeys\"},\
        \"CommonPrefixes\":{\"shape\":\"CommonPrefixList\"},\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"documentation\":\"<p>Encoding type used by Amazon S3 to encode object keys in the response.</p>\"\
        }\
      }\
    },\
    \"ListObjectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Delimiter\":{\
          \"shape\":\"Delimiter\",\
          \"documentation\":\"<p>A delimiter is a character you use to group keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"delimiter\"\
        },\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"location\":\"querystring\",\
          \"locationName\":\"encoding-type\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>Specifies the key to start with when listing objects in a bucket.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"MaxKeys\":{\
          \"shape\":\"MaxKeys\",\
          \"documentation\":\"<p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-keys\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Limits the response to keys that begin with the specified prefix.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"prefix\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"documentation\":\"<p>Confirms that the requester knows that she or he will be charged for the list objects request. Bucket owners need not specify this parameter in their requests.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"ListObjectsV2Output\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria.</p>\"\
        },\
        \"Contents\":{\
          \"shape\":\"ObjectList\",\
          \"documentation\":\"<p>Metadata about each object returned.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to list.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Limits the response to keys that begin with the specified prefix.</p>\"\
        },\
        \"Delimiter\":{\
          \"shape\":\"Delimiter\",\
          \"documentation\":\"<p>A delimiter is a character you use to group keys.</p>\"\
        },\
        \"MaxKeys\":{\
          \"shape\":\"MaxKeys\",\
          \"documentation\":\"<p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>\"\
        },\
        \"CommonPrefixes\":{\
          \"shape\":\"CommonPrefixList\",\
          \"documentation\":\"<p>CommonPrefixes contains all (if there are any) keys between Prefix and the next occurrence of the string specified by delimiter</p>\"\
        },\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"documentation\":\"<p>Encoding type used by Amazon S3 to encode object keys in the response.</p>\"\
        },\
        \"KeyCount\":{\
          \"shape\":\"KeyCount\",\
          \"documentation\":\"<p>KeyCount is the number of keys returned with this request. KeyCount will always be less than equals to MaxKeys field. Say you ask for 50 keys, your result will include less than equals 50 keys </p>\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key</p>\"\
        },\
        \"NextContinuationToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>NextContinuationToken is sent when isTruncated is true which means there are more keys in the bucket that can be listed. The next list requests to Amazon S3 can be continued with this NextContinuationToken. NextContinuationToken is obfuscated and is not a real key</p>\"\
        },\
        \"StartAfter\":{\
          \"shape\":\"StartAfter\",\
          \"documentation\":\"<p>StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket</p>\"\
        }\
      }\
    },\
    \"ListObjectsV2Request\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to list.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Delimiter\":{\
          \"shape\":\"Delimiter\",\
          \"documentation\":\"<p>A delimiter is a character you use to group keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"delimiter\"\
        },\
        \"EncodingType\":{\
          \"shape\":\"EncodingType\",\
          \"documentation\":\"<p>Encoding type used by Amazon S3 to encode object keys in the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"encoding-type\"\
        },\
        \"MaxKeys\":{\
          \"shape\":\"MaxKeys\",\
          \"documentation\":\"<p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-keys\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Limits the response to keys that begin with the specified prefix.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"prefix\"\
        },\
        \"ContinuationToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"continuation-token\"\
        },\
        \"FetchOwner\":{\
          \"shape\":\"FetchOwner\",\
          \"documentation\":\"<p>The owner field is not present in listV2 by default, if you want to return owner field with each key in the result then set the fetch owner field to true</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"fetch-owner\"\
        },\
        \"StartAfter\":{\
          \"shape\":\"StartAfter\",\
          \"documentation\":\"<p>StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"start-after\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"documentation\":\"<p>Confirms that the requester knows that she or he will be charged for the list objects request in V2 style. Bucket owners need not specify this parameter in their requests.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"ListPartsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AbortDate\":{\
          \"shape\":\"AbortDate\",\
          \"documentation\":\"<p>Date when multipart upload will become eligible for abort operation by lifecycle.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-abort-date\"\
        },\
        \"AbortRuleId\":{\
          \"shape\":\"AbortRuleId\",\
          \"documentation\":\"<p>Id of the lifecycle rule that makes a multipart upload eligible for abort operation.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-abort-rule-id\"\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to which the multipart upload was initiated.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Object key for which the multipart upload was initiated.</p>\"\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"documentation\":\"<p>Upload ID identifying the multipart upload whose parts are being listed.</p>\"\
        },\
        \"PartNumberMarker\":{\
          \"shape\":\"PartNumberMarker\",\
          \"documentation\":\"<p>Part number after which listing begins.</p>\"\
        },\
        \"NextPartNumberMarker\":{\
          \"shape\":\"NextPartNumberMarker\",\
          \"documentation\":\"<p>When a list is truncated, this element specifies the last part in the list, as well as the value to use for the part-number-marker request parameter in a subsequent request.</p>\"\
        },\
        \"MaxParts\":{\
          \"shape\":\"MaxParts\",\
          \"documentation\":\"<p>Maximum number of parts that were allowed in the response.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"IsTruncated\",\
          \"documentation\":\"<p>Indicates whether the returned list of parts is truncated.</p>\"\
        },\
        \"Parts\":{\
          \"shape\":\"Parts\",\
          \"locationName\":\"Part\"\
        },\
        \"Initiator\":{\
          \"shape\":\"Initiator\",\
          \"documentation\":\"<p>Identifies who initiated the multipart upload.</p>\"\
        },\
        \"Owner\":{\"shape\":\"Owner\"},\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"ListPartsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\",\
        \"UploadId\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"MaxParts\":{\
          \"shape\":\"MaxParts\",\
          \"documentation\":\"<p>Sets the maximum number of parts to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-parts\"\
        },\
        \"PartNumberMarker\":{\
          \"shape\":\"PartNumberMarker\",\
          \"documentation\":\"<p>Specifies the part after which listing should begin. Only parts with higher part numbers will be listed.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"part-number-marker\"\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"documentation\":\"<p>Upload ID identifying the multipart upload whose parts are being listed.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"uploadId\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"Location\":{\"type\":\"string\"},\
    \"LocationPrefix\":{\"type\":\"string\"},\
    \"LoggingEnabled\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetBucket\",\
        \"TargetPrefix\"\
      ],\
      \"members\":{\
        \"TargetBucket\":{\
          \"shape\":\"TargetBucket\",\
          \"documentation\":\"<p>Specifies the bucket where you want Amazon S3 to store server access logs. You can have your logs delivered to any bucket that you own, including the same bucket that is being logged. You can also configure multiple buckets to deliver their logs to the same target bucket. In this case you should choose a different TargetPrefix for each source bucket so that the delivered log files can be distinguished by key.</p>\"\
        },\
        \"TargetGrants\":{\"shape\":\"TargetGrants\"},\
        \"TargetPrefix\":{\
          \"shape\":\"TargetPrefix\",\
          \"documentation\":\"<p>This element lets you specify a prefix for the keys that the log files will be stored under.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for logging information. Presence of this element indicates that logging is enabled. Parameters TargetBucket and TargetPrefix are required in this case.</p>\"\
    },\
    \"MFA\":{\"type\":\"string\"},\
    \"MFADelete\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"MFADeleteStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"Marker\":{\"type\":\"string\"},\
    \"MaxAgeSeconds\":{\"type\":\"integer\"},\
    \"MaxKeys\":{\"type\":\"integer\"},\
    \"MaxParts\":{\"type\":\"integer\"},\
    \"MaxUploads\":{\"type\":\"integer\"},\
    \"Message\":{\"type\":\"string\"},\
    \"Metadata\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"MetadataKey\"},\
      \"value\":{\"shape\":\"MetadataValue\"}\
    },\
    \"MetadataDirective\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COPY\",\
        \"REPLACE\"\
      ]\
    },\
    \"MetadataEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\"shape\":\"MetadataKey\"},\
        \"Value\":{\"shape\":\"MetadataValue\"}\
      },\
      \"documentation\":\"<p>A metadata key-value pair to store with an object.</p>\"\
    },\
    \"MetadataKey\":{\"type\":\"string\"},\
    \"MetadataValue\":{\"type\":\"string\"},\
    \"MetricsAndOperator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix used when evaluating an AND predicate.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagSet\",\
          \"documentation\":\"<p>The list of tags used when evaluating an AND predicate.</p>\",\
          \"flattened\":true,\
          \"locationName\":\"Tag\"\
        }\
      }\
    },\
    \"MetricsConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"MetricsId\",\
          \"documentation\":\"<p>The ID used to identify the metrics configuration.</p>\"\
        },\
        \"Filter\":{\
          \"shape\":\"MetricsFilter\",\
          \"documentation\":\"<p>Specifies a metrics configuration filter. The metrics configuration will only include objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction (MetricsAndOperator).</p>\"\
        }\
      }\
    },\
    \"MetricsConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricsConfiguration\"},\
      \"flattened\":true\
    },\
    \"MetricsFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix used when evaluating a metrics filter.</p>\"\
        },\
        \"Tag\":{\
          \"shape\":\"Tag\",\
          \"documentation\":\"<p>The tag used when evaluating a metrics filter.</p>\"\
        },\
        \"And\":{\
          \"shape\":\"MetricsAndOperator\",\
          \"documentation\":\"<p>A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates, and an object must match all of the predicates in order for the filter to apply.</p>\"\
        }\
      }\
    },\
    \"MetricsId\":{\"type\":\"string\"},\
    \"MissingMeta\":{\"type\":\"integer\"},\
    \"MultipartUpload\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"documentation\":\"<p>Upload ID that identifies the multipart upload.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Key of the object for which the multipart upload was initiated.</p>\"\
        },\
        \"Initiated\":{\
          \"shape\":\"Initiated\",\
          \"documentation\":\"<p>Date and time at which the multipart upload was initiated.</p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        },\
        \"Owner\":{\"shape\":\"Owner\"},\
        \"Initiator\":{\
          \"shape\":\"Initiator\",\
          \"documentation\":\"<p>Identifies who initiated the multipart upload.</p>\"\
        }\
      }\
    },\
    \"MultipartUploadId\":{\"type\":\"string\"},\
    \"MultipartUploadList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MultipartUpload\"},\
      \"flattened\":true\
    },\
    \"NextKeyMarker\":{\"type\":\"string\"},\
    \"NextMarker\":{\"type\":\"string\"},\
    \"NextPartNumberMarker\":{\"type\":\"integer\"},\
    \"NextToken\":{\"type\":\"string\"},\
    \"NextUploadIdMarker\":{\"type\":\"string\"},\
    \"NextVersionIdMarker\":{\"type\":\"string\"},\
    \"NoSuchBucket\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified bucket does not exist.</p>\",\
      \"exception\":true\
    },\
    \"NoSuchKey\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified key does not exist.</p>\",\
      \"exception\":true\
    },\
    \"NoSuchUpload\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified multipart upload does not exist.</p>\",\
      \"exception\":true\
    },\
    \"NoncurrentVersionExpiration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NoncurrentDays\":{\
          \"shape\":\"Days\",\
          \"documentation\":\"<p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html\\\">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the Amazon Simple Storage Service Developer Guide.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.</p>\"\
    },\
    \"NoncurrentVersionTransition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NoncurrentDays\":{\
          \"shape\":\"Days\",\
          \"documentation\":\"<p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html\\\">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the Amazon Simple Storage Service Developer Guide.</p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"TransitionStorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA, ONEZONE_IA or GLACIER storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA, ONEZONE_IA or GLACIER storage class at a specific period in the object's lifetime.</p>\"\
    },\
    \"NoncurrentVersionTransitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NoncurrentVersionTransition\"},\
      \"flattened\":true\
    },\
    \"NotificationConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicConfigurations\":{\
          \"shape\":\"TopicConfigurationList\",\
          \"locationName\":\"TopicConfiguration\"\
        },\
        \"QueueConfigurations\":{\
          \"shape\":\"QueueConfigurationList\",\
          \"locationName\":\"QueueConfiguration\"\
        },\
        \"LambdaFunctionConfigurations\":{\
          \"shape\":\"LambdaFunctionConfigurationList\",\
          \"locationName\":\"CloudFunctionConfiguration\"\
        }\
      },\
      \"documentation\":\"<p>Container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off on the bucket.</p>\"\
    },\
    \"NotificationConfigurationDeprecated\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicConfiguration\":{\"shape\":\"TopicConfigurationDeprecated\"},\
        \"QueueConfiguration\":{\"shape\":\"QueueConfigurationDeprecated\"},\
        \"CloudFunctionConfiguration\":{\"shape\":\"CloudFunctionConfiguration\"}\
      }\
    },\
    \"NotificationConfigurationFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"S3KeyFilter\",\
          \"locationName\":\"S3Key\"\
        }\
      },\
      \"documentation\":\"<p>Container for object key name filtering rules. For information about key name filtering, go to <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html\\\">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.</p>\"\
    },\
    \"NotificationId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>\"\
    },\
    \"Object\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\"shape\":\"ObjectKey\"},\
        \"LastModified\":{\"shape\":\"LastModified\"},\
        \"ETag\":{\"shape\":\"ETag\"},\
        \"Size\":{\"shape\":\"Size\"},\
        \"StorageClass\":{\
          \"shape\":\"ObjectStorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        },\
        \"Owner\":{\"shape\":\"Owner\"}\
      }\
    },\
    \"ObjectAlreadyInActiveTierError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This operation is not allowed against this storage tier</p>\",\
      \"exception\":true\
    },\
    \"ObjectCannedACL\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"private\",\
        \"public-read\",\
        \"public-read-write\",\
        \"authenticated-read\",\
        \"aws-exec-read\",\
        \"bucket-owner-read\",\
        \"bucket-owner-full-control\"\
      ]\
    },\
    \"ObjectIdentifier\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Key name of the object to delete.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>VersionId for the specific version of the object to delete.</p>\"\
        }\
      }\
    },\
    \"ObjectIdentifierList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ObjectIdentifier\"},\
      \"flattened\":true\
    },\
    \"ObjectKey\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"ObjectList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Object\"},\
      \"flattened\":true\
    },\
    \"ObjectNotInActiveTierError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The source object of the COPY operation is not in the active tier and is only stored in Amazon Glacier.</p>\",\
      \"exception\":true\
    },\
    \"ObjectStorageClass\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"REDUCED_REDUNDANCY\",\
        \"GLACIER\",\
        \"STANDARD_IA\",\
        \"ONEZONE_IA\"\
      ]\
    },\
    \"ObjectVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ETag\":{\"shape\":\"ETag\"},\
        \"Size\":{\
          \"shape\":\"Size\",\
          \"documentation\":\"<p>Size in bytes of the object.</p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"ObjectVersionStorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>The object key.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version ID of an object.</p>\"\
        },\
        \"IsLatest\":{\
          \"shape\":\"IsLatest\",\
          \"documentation\":\"<p>Specifies whether the object is (true) or is not (false) the latest version of an object.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>Date and time the object was last modified.</p>\"\
        },\
        \"Owner\":{\"shape\":\"Owner\"}\
      }\
    },\
    \"ObjectVersionId\":{\"type\":\"string\"},\
    \"ObjectVersionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ObjectVersion\"},\
      \"flattened\":true\
    },\
    \"ObjectVersionStorageClass\":{\
      \"type\":\"string\",\
      \"enum\":[\"STANDARD\"]\
    },\
    \"OutputLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3\":{\
          \"shape\":\"S3Location\",\
          \"documentation\":\"<p>Describes an S3 location that will receive the results of the restore request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the location where the restore job's output is stored.</p>\"\
    },\
    \"OutputSerialization\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CSV\":{\
          \"shape\":\"CSVOutput\",\
          \"documentation\":\"<p>Describes the serialization of CSV-encoded Select results.</p>\"\
        },\
        \"JSON\":{\
          \"shape\":\"JSONOutput\",\
          \"documentation\":\"<p>Specifies JSON as request's output serialization format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes how results of the Select job are serialized.</p>\"\
    },\
    \"Owner\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DisplayName\":{\"shape\":\"DisplayName\"},\
        \"ID\":{\"shape\":\"ID\"}\
      }\
    },\
    \"OwnerOverride\":{\
      \"type\":\"string\",\
      \"enum\":[\"Destination\"]\
    },\
    \"ParquetInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Part\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PartNumber\":{\
          \"shape\":\"PartNumber\",\
          \"documentation\":\"<p>Part number identifying the part. This is a positive integer between 1 and 10,000.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>Date and time at which the part was uploaded.</p>\"\
        },\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>Entity tag returned when the part was uploaded.</p>\"\
        },\
        \"Size\":{\
          \"shape\":\"Size\",\
          \"documentation\":\"<p>Size of the uploaded part data.</p>\"\
        }\
      }\
    },\
    \"PartNumber\":{\"type\":\"integer\"},\
    \"PartNumberMarker\":{\"type\":\"integer\"},\
    \"Parts\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Part\"},\
      \"flattened\":true\
    },\
    \"PartsCount\":{\"type\":\"integer\"},\
    \"Payer\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Requester\",\
        \"BucketOwner\"\
      ]\
    },\
    \"Permission\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FULL_CONTROL\",\
        \"WRITE\",\
        \"WRITE_ACP\",\
        \"READ\",\
        \"READ_ACP\"\
      ]\
    },\
    \"Policy\":{\"type\":\"string\"},\
    \"Prefix\":{\"type\":\"string\"},\
    \"Priority\":{\"type\":\"integer\"},\
    \"Progress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BytesScanned\":{\
          \"shape\":\"BytesScanned\",\
          \"documentation\":\"<p>Current number of object bytes scanned.</p>\"\
        },\
        \"BytesProcessed\":{\
          \"shape\":\"BytesProcessed\",\
          \"documentation\":\"<p>Current number of uncompressed object bytes processed.</p>\"\
        },\
        \"BytesReturned\":{\
          \"shape\":\"BytesReturned\",\
          \"documentation\":\"<p>Current number of bytes of records payload data returned.</p>\"\
        }\
      }\
    },\
    \"ProgressEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Details\":{\
          \"shape\":\"Progress\",\
          \"documentation\":\"<p>The Progress event details.</p>\",\
          \"eventpayload\":true\
        }\
      },\
      \"event\":true\
    },\
    \"Protocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"http\",\
        \"https\"\
      ]\
    },\
    \"PutBucketAccelerateConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"AccelerateConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket for which the accelerate configuration is set.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"AccelerateConfiguration\":{\
          \"shape\":\"AccelerateConfiguration\",\
          \"documentation\":\"<p>Specifies the Accelerate Configuration you want to set for the bucket.</p>\",\
          \"locationName\":\"AccelerateConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"AccelerateConfiguration\"\
    },\
    \"PutBucketAclRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"ACL\":{\
          \"shape\":\"BucketCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-acl\"\
        },\
        \"AccessControlPolicy\":{\
          \"shape\":\"AccessControlPolicy\",\
          \"locationName\":\"AccessControlPolicy\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"GrantFullControl\":{\
          \"shape\":\"GrantFullControl\",\
          \"documentation\":\"<p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-full-control\"\
        },\
        \"GrantRead\":{\
          \"shape\":\"GrantRead\",\
          \"documentation\":\"<p>Allows grantee to list the objects in the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read\"\
        },\
        \"GrantReadACP\":{\
          \"shape\":\"GrantReadACP\",\
          \"documentation\":\"<p>Allows grantee to read the bucket ACL.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read-acp\"\
        },\
        \"GrantWrite\":{\
          \"shape\":\"GrantWrite\",\
          \"documentation\":\"<p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write\"\
        },\
        \"GrantWriteACP\":{\
          \"shape\":\"GrantWriteACP\",\
          \"documentation\":\"<p>Allows grantee to write the ACL for the applicable bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write-acp\"\
        }\
      },\
      \"payload\":\"AccessControlPolicy\"\
    },\
    \"PutBucketAnalyticsConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\",\
        \"AnalyticsConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket to which an analytics configuration is stored.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"AnalyticsId\",\
          \"documentation\":\"<p>The identifier used to represent an analytics configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        },\
        \"AnalyticsConfiguration\":{\
          \"shape\":\"AnalyticsConfiguration\",\
          \"documentation\":\"<p>The configuration and any analyses for the analytics filter.</p>\",\
          \"locationName\":\"AnalyticsConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"AnalyticsConfiguration\"\
    },\
    \"PutBucketCorsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"CORSConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"CORSConfiguration\":{\
          \"shape\":\"CORSConfiguration\",\
          \"locationName\":\"CORSConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        }\
      },\
      \"payload\":\"CORSConfiguration\"\
    },\
    \"PutBucketEncryptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"ServerSideEncryptionConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket for which the server-side encryption configuration is set.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"documentation\":\"<p>The base64-encoded 128-bit MD5 digest of the server-side encryption configuration.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"ServerSideEncryptionConfiguration\":{\
          \"shape\":\"ServerSideEncryptionConfiguration\",\
          \"locationName\":\"ServerSideEncryptionConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"ServerSideEncryptionConfiguration\"\
    },\
    \"PutBucketInventoryConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\",\
        \"InventoryConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket where the inventory configuration will be stored.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"InventoryId\",\
          \"documentation\":\"<p>The ID used to identify the inventory configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        },\
        \"InventoryConfiguration\":{\
          \"shape\":\"InventoryConfiguration\",\
          \"documentation\":\"<p>Specifies the inventory configuration.</p>\",\
          \"locationName\":\"InventoryConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"InventoryConfiguration\"\
    },\
    \"PutBucketLifecycleConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"LifecycleConfiguration\":{\
          \"shape\":\"BucketLifecycleConfiguration\",\
          \"locationName\":\"LifecycleConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"LifecycleConfiguration\"\
    },\
    \"PutBucketLifecycleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"LifecycleConfiguration\":{\
          \"shape\":\"LifecycleConfiguration\",\
          \"locationName\":\"LifecycleConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"LifecycleConfiguration\"\
    },\
    \"PutBucketLoggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"BucketLoggingStatus\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"BucketLoggingStatus\":{\
          \"shape\":\"BucketLoggingStatus\",\
          \"locationName\":\"BucketLoggingStatus\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        }\
      },\
      \"payload\":\"BucketLoggingStatus\"\
    },\
    \"PutBucketMetricsConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Id\",\
        \"MetricsConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket for which the metrics configuration is set.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Id\":{\
          \"shape\":\"MetricsId\",\
          \"documentation\":\"<p>The ID used to identify the metrics configuration.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        },\
        \"MetricsConfiguration\":{\
          \"shape\":\"MetricsConfiguration\",\
          \"documentation\":\"<p>Specifies the metrics configuration.</p>\",\
          \"locationName\":\"MetricsConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"MetricsConfiguration\"\
    },\
    \"PutBucketNotificationConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"NotificationConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"locationName\":\"NotificationConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"NotificationConfiguration\"\
    },\
    \"PutBucketNotificationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"NotificationConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfigurationDeprecated\",\
          \"locationName\":\"NotificationConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"NotificationConfiguration\"\
    },\
    \"PutBucketPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Policy\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"ConfirmRemoveSelfBucketAccess\":{\
          \"shape\":\"ConfirmRemoveSelfBucketAccess\",\
          \"documentation\":\"<p>Set this parameter to true to confirm that you want to remove your permissions to change this bucket policy in the future.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-confirm-remove-self-bucket-access\"\
        },\
        \"Policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The bucket policy as a JSON document.</p>\"\
        }\
      },\
      \"payload\":\"Policy\"\
    },\
    \"PutBucketReplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"ReplicationConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"ReplicationConfiguration\":{\
          \"shape\":\"ReplicationConfiguration\",\
          \"locationName\":\"ReplicationConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"ReplicationConfiguration\"\
    },\
    \"PutBucketRequestPaymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"RequestPaymentConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"RequestPaymentConfiguration\":{\
          \"shape\":\"RequestPaymentConfiguration\",\
          \"locationName\":\"RequestPaymentConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"RequestPaymentConfiguration\"\
    },\
    \"PutBucketTaggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Tagging\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"Tagging\":{\
          \"shape\":\"Tagging\",\
          \"locationName\":\"Tagging\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"Tagging\"\
    },\
    \"PutBucketVersioningRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"VersioningConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"MFA\":{\
          \"shape\":\"MFA\",\
          \"documentation\":\"<p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mfa\"\
        },\
        \"VersioningConfiguration\":{\
          \"shape\":\"VersioningConfiguration\",\
          \"locationName\":\"VersioningConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"VersioningConfiguration\"\
    },\
    \"PutBucketWebsiteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"WebsiteConfiguration\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"WebsiteConfiguration\":{\
          \"shape\":\"WebsiteConfiguration\",\
          \"locationName\":\"WebsiteConfiguration\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"WebsiteConfiguration\"\
    },\
    \"PutObjectAclOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"PutObjectAclRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"ACL\":{\
          \"shape\":\"ObjectCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-acl\"\
        },\
        \"AccessControlPolicy\":{\
          \"shape\":\"AccessControlPolicy\",\
          \"locationName\":\"AccessControlPolicy\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"GrantFullControl\":{\
          \"shape\":\"GrantFullControl\",\
          \"documentation\":\"<p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-full-control\"\
        },\
        \"GrantRead\":{\
          \"shape\":\"GrantRead\",\
          \"documentation\":\"<p>Allows grantee to list the objects in the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read\"\
        },\
        \"GrantReadACP\":{\
          \"shape\":\"GrantReadACP\",\
          \"documentation\":\"<p>Allows grantee to read the bucket ACL.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read-acp\"\
        },\
        \"GrantWrite\":{\
          \"shape\":\"GrantWrite\",\
          \"documentation\":\"<p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write\"\
        },\
        \"GrantWriteACP\":{\
          \"shape\":\"GrantWriteACP\",\
          \"documentation\":\"<p>Allows grantee to write the ACL for the applicable bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write-acp\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>VersionId used to reference a specific version of the object.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        }\
      },\
      \"payload\":\"AccessControlPolicy\"\
    },\
    \"PutObjectOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Expiration\":{\
          \"shape\":\"Expiration\",\
          \"documentation\":\"<p>If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-expiration\"\
        },\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>Entity tag for the uploaded object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"ETag\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"documentation\":\"<p>Version of the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"PutObjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"ACL\":{\
          \"shape\":\"ObjectCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-acl\"\
        },\
        \"Body\":{\
          \"shape\":\"Body\",\
          \"documentation\":\"<p>Object data.</p>\",\
          \"streaming\":true\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to which the PUT operation was initiated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"CacheControl\":{\
          \"shape\":\"CacheControl\",\
          \"documentation\":\"<p>Specifies caching behavior along the request/reply chain.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Cache-Control\"\
        },\
        \"ContentDisposition\":{\
          \"shape\":\"ContentDisposition\",\
          \"documentation\":\"<p>Specifies presentational information for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Disposition\"\
        },\
        \"ContentEncoding\":{\
          \"shape\":\"ContentEncoding\",\
          \"documentation\":\"<p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Encoding\"\
        },\
        \"ContentLanguage\":{\
          \"shape\":\"ContentLanguage\",\
          \"documentation\":\"<p>The language the content is in.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Language\"\
        },\
        \"ContentLength\":{\
          \"shape\":\"ContentLength\",\
          \"documentation\":\"<p>Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Length\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"documentation\":\"<p>The base64-encoded 128-bit MD5 digest of the part data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the object data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The date and time at which the object is no longer cacheable.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Expires\"\
        },\
        \"GrantFullControl\":{\
          \"shape\":\"GrantFullControl\",\
          \"documentation\":\"<p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-full-control\"\
        },\
        \"GrantRead\":{\
          \"shape\":\"GrantRead\",\
          \"documentation\":\"<p>Allows grantee to read the object data and its metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read\"\
        },\
        \"GrantReadACP\":{\
          \"shape\":\"GrantReadACP\",\
          \"documentation\":\"<p>Allows grantee to read the object ACL.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-read-acp\"\
        },\
        \"GrantWriteACP\":{\
          \"shape\":\"GrantWriteACP\",\
          \"documentation\":\"<p>Allows grantee to write the ACL for the applicable object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-grant-write-acp\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Object key for which the PUT operation was initiated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>A map of metadata to store with the object in S3.</p>\",\
          \"location\":\"headers\",\
          \"locationName\":\"x-amz-meta-\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The type of storage to use for the object. Defaults to 'STANDARD'.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-storage-class\"\
        },\
        \"WebsiteRedirectLocation\":{\
          \"shape\":\"WebsiteRedirectLocation\",\
          \"documentation\":\"<p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-website-redirect-location\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        },\
        \"Tagging\":{\
          \"shape\":\"TaggingHeader\",\
          \"documentation\":\"<p>The tag-set for the object. The tag-set must be encoded as URL Query parameters</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-tagging\"\
        }\
      },\
      \"payload\":\"Body\"\
    },\
    \"PutObjectTaggingOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-version-id\"\
        }\
      }\
    },\
    \"PutObjectTaggingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\",\
        \"Tagging\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"Tagging\":{\
          \"shape\":\"Tagging\",\
          \"locationName\":\"Tagging\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        }\
      },\
      \"payload\":\"Tagging\"\
    },\
    \"QueueArn\":{\"type\":\"string\"},\
    \"QueueConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueArn\",\
        \"Events\"\
      ],\
      \"members\":{\
        \"Id\":{\"shape\":\"NotificationId\"},\
        \"QueueArn\":{\
          \"shape\":\"QueueArn\",\
          \"documentation\":\"<p>Amazon SQS queue ARN to which Amazon S3 will publish a message when it detects events of specified type.</p>\",\
          \"locationName\":\"Queue\"\
        },\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"locationName\":\"Event\"\
        },\
        \"Filter\":{\"shape\":\"NotificationConfigurationFilter\"}\
      },\
      \"documentation\":\"<p>Container for specifying an configuration when you want Amazon S3 to publish events to an Amazon Simple Queue Service (Amazon SQS) queue.</p>\"\
    },\
    \"QueueConfigurationDeprecated\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\"shape\":\"NotificationId\"},\
        \"Event\":{\
          \"shape\":\"Event\",\
          \"deprecated\":true\
        },\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"locationName\":\"Event\"\
        },\
        \"Queue\":{\"shape\":\"QueueArn\"}\
      }\
    },\
    \"QueueConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueConfiguration\"},\
      \"flattened\":true\
    },\
    \"Quiet\":{\"type\":\"boolean\"},\
    \"QuoteCharacter\":{\"type\":\"string\"},\
    \"QuoteEscapeCharacter\":{\"type\":\"string\"},\
    \"QuoteFields\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALWAYS\",\
        \"ASNEEDED\"\
      ]\
    },\
    \"Range\":{\"type\":\"string\"},\
    \"RecordDelimiter\":{\"type\":\"string\"},\
    \"RecordsEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Payload\":{\
          \"shape\":\"Body\",\
          \"documentation\":\"<p>The byte array of partial, one or more result records.</p>\",\
          \"eventpayload\":true\
        }\
      },\
      \"event\":true\
    },\
    \"Redirect\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HostName\":{\
          \"shape\":\"HostName\",\
          \"documentation\":\"<p>The host name to use in the redirect request.</p>\"\
        },\
        \"HttpRedirectCode\":{\
          \"shape\":\"HttpRedirectCode\",\
          \"documentation\":\"<p>The HTTP redirect code to use on the response. Not required if one of the siblings is present.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"Protocol\",\
          \"documentation\":\"<p>Protocol to use (http, https) when redirecting requests. The default is the protocol that is used in the original request.</p>\"\
        },\
        \"ReplaceKeyPrefixWith\":{\
          \"shape\":\"ReplaceKeyPrefixWith\",\
          \"documentation\":\"<p>The object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix docs/ (objects in the docs/ folder) to documents/, you can set a condition block with KeyPrefixEquals set to docs/ and in the Redirect set ReplaceKeyPrefixWith to /documents. Not required if one of the siblings is present. Can be present only if ReplaceKeyWith is not provided.</p>\"\
        },\
        \"ReplaceKeyWith\":{\
          \"shape\":\"ReplaceKeyWith\",\
          \"documentation\":\"<p>The specific object key to use in the redirect request. For example, redirect request to error.html. Not required if one of the sibling is present. Can be present only if ReplaceKeyPrefixWith is not provided.</p>\"\
        }\
      }\
    },\
    \"RedirectAllRequestsTo\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostName\"],\
      \"members\":{\
        \"HostName\":{\
          \"shape\":\"HostName\",\
          \"documentation\":\"<p>Name of the host where requests will be redirected.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"Protocol\",\
          \"documentation\":\"<p>Protocol to use (http, https) when redirecting requests. The default is the protocol that is used in the original request.</p>\"\
        }\
      }\
    },\
    \"ReplaceKeyPrefixWith\":{\"type\":\"string\"},\
    \"ReplaceKeyWith\":{\"type\":\"string\"},\
    \"ReplicaKmsKeyID\":{\"type\":\"string\"},\
    \"ReplicationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Role\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"Role\":{\
          \"shape\":\"Role\",\
          \"documentation\":\"<p>Amazon Resource Name (ARN) of an IAM role for Amazon S3 to assume when replicating the objects.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"ReplicationRules\",\
          \"documentation\":\"<p>Container for one or more replication rules. Replication configuration must have at least one rule and can contain up to 1,000 rules. </p>\",\
          \"locationName\":\"Rule\"\
        }\
      },\
      \"documentation\":\"<p>Container for replication rules. You can add as many as 1,000 rules. Total replication configuration size can be up to 2 MB.</p>\"\
    },\
    \"ReplicationRule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Status\",\
        \"Destination\"\
      ],\
      \"members\":{\
        \"ID\":{\
          \"shape\":\"ID\",\
          \"documentation\":\"<p>Unique identifier for the rule. The value cannot be longer than 255 characters.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"Priority\",\
          \"documentation\":\"<p>The priority associated with the rule. If you specify multiple rules in a replication configuration, then Amazon S3 applies rule priority in the event there are conflicts (two or more rules identify the same object based on filter specified). The rule with higher priority takes precedence. For example,</p> <ul> <li> <p>Same object quality prefix based filter criteria If prefixes you specified in multiple rules overlap. </p> </li> <li> <p>Same object qualify tag based filter criteria specified in multiple rules</p> </li> </ul> <p>For more information, see <a href=\\\" https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html\\\">Cross-Region Replication (CRR)</a> in the Amazon S3 Developer Guide.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Object keyname prefix identifying one or more objects to which the rule applies. Maximum prefix length can be up to 1,024 characters. </p>\",\
          \"deprecated\":true\
        },\
        \"Filter\":{\"shape\":\"ReplicationRuleFilter\"},\
        \"Status\":{\
          \"shape\":\"ReplicationRuleStatus\",\
          \"documentation\":\"<p>The rule is ignored if status is not Enabled.</p>\"\
        },\
        \"SourceSelectionCriteria\":{\
          \"shape\":\"SourceSelectionCriteria\",\
          \"documentation\":\"<p> Container that describes additional filters in identifying source objects that you want to replicate. Currently, Amazon S3 supports only the filter that you can specify for objects created with server-side encryption using an AWS KMS-managed key. You can choose to enable or disable replication of these objects. </p> <p> if you want Amazon S3 to replicate objects created with server-side encryption using AWS KMS-managed keys. </p>\"\
        },\
        \"Destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>Container for replication destination information.</p>\"\
        },\
        \"DeleteMarkerReplication\":{\"shape\":\"DeleteMarkerReplication\"}\
      },\
      \"documentation\":\"<p>Container for information about a particular replication rule.</p>\"\
    },\
    \"ReplicationRuleAndOperator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\"shape\":\"Prefix\"},\
        \"Tags\":{\
          \"shape\":\"TagSet\",\
          \"flattened\":true,\
          \"locationName\":\"Tag\"\
        }\
      }\
    },\
    \"ReplicationRuleFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Object keyname prefix that identifies subset of objects to which the rule applies.</p>\"\
        },\
        \"Tag\":{\
          \"shape\":\"Tag\",\
          \"documentation\":\"<p>Container for specifying a tag key and value. </p> <p>The rule applies only to objects having the tag in its tagset.</p>\"\
        },\
        \"And\":{\
          \"shape\":\"ReplicationRuleAndOperator\",\
          \"documentation\":\"<p>Container for specifying rule filters. These filters determine the subset of objects to which the rule applies. The element is required only if you specify more than one filter. For example: </p> <ul> <li> <p>You specify both a <code>Prefix</code> and a <code>Tag</code> filters. Then you wrap these in an <code>And</code> tag.</p> </li> <li> <p>You specify filter based on multiple tags. Then you wrap the <code>Tag</code> elements in an <code>And</code> tag.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Filter that identifies subset of objects to which the replication rule applies. A <code>Filter</code> must specify exactly one <code>Prefix</code>, <code>Tag</code>, or an <code>And</code> child element.</p>\"\
    },\
    \"ReplicationRuleStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"ReplicationRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReplicationRule\"},\
      \"flattened\":true\
    },\
    \"ReplicationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPLETE\",\
        \"PENDING\",\
        \"FAILED\",\
        \"REPLICA\"\
      ]\
    },\
    \"RequestCharged\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>If present, indicates that the requester was successfully charged for the request.</p>\",\
      \"enum\":[\"requester\"]\
    },\
    \"RequestPayer\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>\",\
      \"enum\":[\"requester\"]\
    },\
    \"RequestPaymentConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Payer\"],\
      \"members\":{\
        \"Payer\":{\
          \"shape\":\"Payer\",\
          \"documentation\":\"<p>Specifies who pays for the download and request fees.</p>\"\
        }\
      }\
    },\
    \"RequestProgress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"EnableRequestProgress\",\
          \"documentation\":\"<p>Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE, FALSE. Default value: FALSE.</p>\"\
        }\
      }\
    },\
    \"ResponseCacheControl\":{\"type\":\"string\"},\
    \"ResponseContentDisposition\":{\"type\":\"string\"},\
    \"ResponseContentEncoding\":{\"type\":\"string\"},\
    \"ResponseContentLanguage\":{\"type\":\"string\"},\
    \"ResponseContentType\":{\"type\":\"string\"},\
    \"ResponseExpires\":{\"type\":\"timestamp\"},\
    \"Restore\":{\"type\":\"string\"},\
    \"RestoreObjectOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        },\
        \"RestoreOutputPath\":{\
          \"shape\":\"RestoreOutputPath\",\
          \"documentation\":\"<p>Indicates the path in the provided S3 output location where Select results will be restored to.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-restore-output-path\"\
        }\
      }\
    },\
    \"RestoreObjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"VersionId\":{\
          \"shape\":\"ObjectVersionId\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        },\
        \"RestoreRequest\":{\
          \"shape\":\"RestoreRequest\",\
          \"locationName\":\"RestoreRequest\",\
          \"xmlNamespace\":{\"uri\":\"http://s3.amazonaws.com/doc/2006-03-01/\"}\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      },\
      \"payload\":\"RestoreRequest\"\
    },\
    \"RestoreOutputPath\":{\"type\":\"string\"},\
    \"RestoreRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Days\":{\
          \"shape\":\"Days\",\
          \"documentation\":\"<p>Lifetime of the active copy in days. Do not use with restores that specify OutputLocation.</p>\"\
        },\
        \"GlacierJobParameters\":{\
          \"shape\":\"GlacierJobParameters\",\
          \"documentation\":\"<p>Glacier related parameters pertaining to this job. Do not use with restores that specify OutputLocation.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RestoreRequestType\",\
          \"documentation\":\"<p>Type of restore request.</p>\"\
        },\
        \"Tier\":{\
          \"shape\":\"Tier\",\
          \"documentation\":\"<p>Glacier retrieval tier at which the restore will be processed.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The optional description for the job.</p>\"\
        },\
        \"SelectParameters\":{\
          \"shape\":\"SelectParameters\",\
          \"documentation\":\"<p>Describes the parameters for Select job types.</p>\"\
        },\
        \"OutputLocation\":{\
          \"shape\":\"OutputLocation\",\
          \"documentation\":\"<p>Describes the location where the restore job's output is stored.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for restore job parameters.</p>\"\
    },\
    \"RestoreRequestType\":{\
      \"type\":\"string\",\
      \"enum\":[\"SELECT\"]\
    },\
    \"Role\":{\"type\":\"string\"},\
    \"RoutingRule\":{\
      \"type\":\"structure\",\
      \"required\":[\"Redirect\"],\
      \"members\":{\
        \"Condition\":{\
          \"shape\":\"Condition\",\
          \"documentation\":\"<p>A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.</p>\"\
        },\
        \"Redirect\":{\
          \"shape\":\"Redirect\",\
          \"documentation\":\"<p>Container for redirect information. You can redirect requests to another host, to another page, or with another protocol. In the event of an error, you can can specify a different error code to return.</p>\"\
        }\
      }\
    },\
    \"RoutingRules\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RoutingRule\",\
        \"locationName\":\"RoutingRule\"\
      }\
    },\
    \"Rule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Prefix\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"Expiration\":{\"shape\":\"LifecycleExpiration\"},\
        \"ID\":{\
          \"shape\":\"ID\",\
          \"documentation\":\"<p>Unique identifier for the rule. The value cannot be longer than 255 characters.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>Prefix identifying one or more objects to which the rule applies.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ExpirationStatus\",\
          \"documentation\":\"<p>If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.</p>\"\
        },\
        \"Transition\":{\"shape\":\"Transition\"},\
        \"NoncurrentVersionTransition\":{\"shape\":\"NoncurrentVersionTransition\"},\
        \"NoncurrentVersionExpiration\":{\"shape\":\"NoncurrentVersionExpiration\"},\
        \"AbortIncompleteMultipartUpload\":{\"shape\":\"AbortIncompleteMultipartUpload\"}\
      }\
    },\
    \"Rules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Rule\"},\
      \"flattened\":true\
    },\
    \"S3KeyFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FilterRules\":{\
          \"shape\":\"FilterRuleList\",\
          \"locationName\":\"FilterRule\"\
        }\
      },\
      \"documentation\":\"<p>Container for object key name prefix and suffix filtering rules.</p>\"\
    },\
    \"S3Location\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BucketName\",\
        \"Prefix\"\
      ],\
      \"members\":{\
        \"BucketName\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The name of the bucket where the restore results will be placed.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"LocationPrefix\",\
          \"documentation\":\"<p>The prefix that is prepended to the restore results for this request.</p>\"\
        },\
        \"Encryption\":{\"shape\":\"Encryption\"},\
        \"CannedACL\":{\
          \"shape\":\"ObjectCannedACL\",\
          \"documentation\":\"<p>The canned ACL to apply to the restore results.</p>\"\
        },\
        \"AccessControlList\":{\
          \"shape\":\"Grants\",\
          \"documentation\":\"<p>A list of grants that control access to the staged results.</p>\"\
        },\
        \"Tagging\":{\
          \"shape\":\"Tagging\",\
          \"documentation\":\"<p>The tag-set that is applied to the restore results.</p>\"\
        },\
        \"UserMetadata\":{\
          \"shape\":\"UserMetadata\",\
          \"documentation\":\"<p>A list of metadata to store with the restore results in S3.</p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the restore results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an S3 location that will receive the results of the restore request.</p>\"\
    },\
    \"SSECustomerAlgorithm\":{\"type\":\"string\"},\
    \"SSECustomerKey\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"SSECustomerKeyMD5\":{\"type\":\"string\"},\
    \"SSEKMS\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>Specifies the ID of the AWS Key Management Service (KMS) master encryption key to use for encrypting Inventory reports.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the use of SSE-KMS to encrypt delievered Inventory reports.</p>\",\
      \"locationName\":\"SSE-KMS\"\
    },\
    \"SSEKMSKeyId\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"SSES3\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Specifies the use of SSE-S3 to encrypt delievered Inventory reports.</p>\",\
      \"locationName\":\"SSE-S3\"\
    },\
    \"SelectObjectContentEventStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Records\":{\
          \"shape\":\"RecordsEvent\",\
          \"documentation\":\"<p>The Records Event.</p>\"\
        },\
        \"Stats\":{\
          \"shape\":\"StatsEvent\",\
          \"documentation\":\"<p>The Stats Event.</p>\"\
        },\
        \"Progress\":{\
          \"shape\":\"ProgressEvent\",\
          \"documentation\":\"<p>The Progress Event.</p>\"\
        },\
        \"Cont\":{\
          \"shape\":\"ContinuationEvent\",\
          \"documentation\":\"<p>The Continuation Event.</p>\"\
        },\
        \"End\":{\
          \"shape\":\"EndEvent\",\
          \"documentation\":\"<p>The End Event.</p>\"\
        }\
      },\
      \"eventstream\":true\
    },\
    \"SelectObjectContentOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Payload\":{\"shape\":\"SelectObjectContentEventStream\"}\
      },\
      \"payload\":\"Payload\"\
    },\
    \"SelectObjectContentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\",\
        \"Expression\",\
        \"ExpressionType\",\
        \"InputSerialization\",\
        \"OutputSerialization\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The S3 Bucket.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>The Object Key.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>The SSE Algorithm used to encrypt the object. For more information, go to <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html\\\"> Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>The SSE Customer Key. For more information, go to <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html\\\"> Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>The SSE Customer Key MD5. For more information, go to <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html\\\"> Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"Expression\":{\
          \"shape\":\"Expression\",\
          \"documentation\":\"<p>The expression that is used to query the object.</p>\"\
        },\
        \"ExpressionType\":{\
          \"shape\":\"ExpressionType\",\
          \"documentation\":\"<p>The type of the provided expression (e.g., SQL).</p>\"\
        },\
        \"RequestProgress\":{\
          \"shape\":\"RequestProgress\",\
          \"documentation\":\"<p>Specifies if periodic request progress information should be enabled.</p>\"\
        },\
        \"InputSerialization\":{\
          \"shape\":\"InputSerialization\",\
          \"documentation\":\"<p>Describes the format of the data in the object that is being queried.</p>\"\
        },\
        \"OutputSerialization\":{\
          \"shape\":\"OutputSerialization\",\
          \"documentation\":\"<p>Describes the format of the data that you want Amazon S3 to return in response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Request to filter the contents of an Amazon S3 object based on a simple Structured Query Language (SQL) statement. In the request, along with the SQL expression, you must also specify a data serialization format (JSON or CSV) of the object. Amazon S3 uses this to parse object data into records, and returns only records that match the specified SQL expression. You must also specify the data serialization format for the response. For more information, go to <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectSELECTContent.html\\\">S3Select API Documentation</a>.</p>\"\
    },\
    \"SelectParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputSerialization\",\
        \"ExpressionType\",\
        \"Expression\",\
        \"OutputSerialization\"\
      ],\
      \"members\":{\
        \"InputSerialization\":{\
          \"shape\":\"InputSerialization\",\
          \"documentation\":\"<p>Describes the serialization format of the object.</p>\"\
        },\
        \"ExpressionType\":{\
          \"shape\":\"ExpressionType\",\
          \"documentation\":\"<p>The type of the provided expression (e.g., SQL).</p>\"\
        },\
        \"Expression\":{\
          \"shape\":\"Expression\",\
          \"documentation\":\"<p>The expression that is used to query the object.</p>\"\
        },\
        \"OutputSerialization\":{\
          \"shape\":\"OutputSerialization\",\
          \"documentation\":\"<p>Describes how the results of the Select job are serialized.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the parameters for Select job types.</p>\"\
    },\
    \"ServerSideEncryption\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AES256\",\
        \"aws:kms\"\
      ]\
    },\
    \"ServerSideEncryptionByDefault\":{\
      \"type\":\"structure\",\
      \"required\":[\"SSEAlgorithm\"],\
      \"members\":{\
        \"SSEAlgorithm\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>Server-side encryption algorithm to use for the default encryption.</p>\"\
        },\
        \"KMSMasterKeyID\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>KMS master key ID to use for the default encryption. This parameter is allowed if SSEAlgorithm is aws:kms.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the default server-side encryption to apply to new objects in the bucket. If Put Object request does not specify any server-side encryption, this default encryption will be applied.</p>\"\
    },\
    \"ServerSideEncryptionConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Rules\"],\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"ServerSideEncryptionRules\",\
          \"documentation\":\"<p>Container for information about a particular server-side encryption configuration rule.</p>\",\
          \"locationName\":\"Rule\"\
        }\
      },\
      \"documentation\":\"<p>Container for server-side encryption configuration rules. Currently S3 supports one rule only.</p>\"\
    },\
    \"ServerSideEncryptionRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplyServerSideEncryptionByDefault\":{\
          \"shape\":\"ServerSideEncryptionByDefault\",\
          \"documentation\":\"<p>Describes the default server-side encryption to apply to new objects in the bucket. If Put Object request does not specify any server-side encryption, this default encryption will be applied.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for information about a particular server-side encryption configuration rule.</p>\"\
    },\
    \"ServerSideEncryptionRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ServerSideEncryptionRule\"},\
      \"flattened\":true\
    },\
    \"Size\":{\"type\":\"integer\"},\
    \"SourceSelectionCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SseKmsEncryptedObjects\":{\
          \"shape\":\"SseKmsEncryptedObjects\",\
          \"documentation\":\"<p> Container for filter information of selection of KMS Encrypted S3 objects. The element is required if you include <code>SourceSelectionCriteria</code> in the replication configuration. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for filters that define which source objects should be replicated.</p>\"\
    },\
    \"SseKmsEncryptedObjects\":{\
      \"type\":\"structure\",\
      \"required\":[\"Status\"],\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"SseKmsEncryptedObjectsStatus\",\
          \"documentation\":\"<p>The replication for KMS encrypted S3 objects is disabled if status is not Enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for filter information of selection of KMS Encrypted S3 objects.</p>\"\
    },\
    \"SseKmsEncryptedObjectsStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"StartAfter\":{\"type\":\"string\"},\
    \"Stats\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BytesScanned\":{\
          \"shape\":\"BytesScanned\",\
          \"documentation\":\"<p>Total number of object bytes scanned.</p>\"\
        },\
        \"BytesProcessed\":{\
          \"shape\":\"BytesProcessed\",\
          \"documentation\":\"<p>Total number of uncompressed object bytes processed.</p>\"\
        },\
        \"BytesReturned\":{\
          \"shape\":\"BytesReturned\",\
          \"documentation\":\"<p>Total number of bytes of records payload data returned.</p>\"\
        }\
      }\
    },\
    \"StatsEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Details\":{\
          \"shape\":\"Stats\",\
          \"documentation\":\"<p>The Stats event details.</p>\",\
          \"eventpayload\":true\
        }\
      },\
      \"event\":true\
    },\
    \"StorageClass\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"REDUCED_REDUNDANCY\",\
        \"STANDARD_IA\",\
        \"ONEZONE_IA\"\
      ]\
    },\
    \"StorageClassAnalysis\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataExport\":{\
          \"shape\":\"StorageClassAnalysisDataExport\",\
          \"documentation\":\"<p>A container used to describe how data related to the storage class analysis should be exported.</p>\"\
        }\
      }\
    },\
    \"StorageClassAnalysisDataExport\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"OutputSchemaVersion\",\
        \"Destination\"\
      ],\
      \"members\":{\
        \"OutputSchemaVersion\":{\
          \"shape\":\"StorageClassAnalysisSchemaVersion\",\
          \"documentation\":\"<p>The version of the output schema to use when exporting data. Must be V_1.</p>\"\
        },\
        \"Destination\":{\
          \"shape\":\"AnalyticsExportDestination\",\
          \"documentation\":\"<p>The place to store the data for an analysis.</p>\"\
        }\
      }\
    },\
    \"StorageClassAnalysisSchemaVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\"V_1\"]\
    },\
    \"Suffix\":{\"type\":\"string\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Name of the tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>Value of the tag.</p>\"\
        }\
      }\
    },\
    \"TagCount\":{\"type\":\"integer\"},\
    \"TagSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Tag\",\
        \"locationName\":\"Tag\"\
      }\
    },\
    \"Tagging\":{\
      \"type\":\"structure\",\
      \"required\":[\"TagSet\"],\
      \"members\":{\
        \"TagSet\":{\"shape\":\"TagSet\"}\
      }\
    },\
    \"TaggingDirective\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COPY\",\
        \"REPLACE\"\
      ]\
    },\
    \"TaggingHeader\":{\"type\":\"string\"},\
    \"TargetBucket\":{\"type\":\"string\"},\
    \"TargetGrant\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Grantee\":{\"shape\":\"Grantee\"},\
        \"Permission\":{\
          \"shape\":\"BucketLogsPermission\",\
          \"documentation\":\"<p>Logging permissions assigned to the Grantee for the bucket.</p>\"\
        }\
      }\
    },\
    \"TargetGrants\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TargetGrant\",\
        \"locationName\":\"Grant\"\
      }\
    },\
    \"TargetPrefix\":{\"type\":\"string\"},\
    \"Tier\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Standard\",\
        \"Bulk\",\
        \"Expedited\"\
      ]\
    },\
    \"Token\":{\"type\":\"string\"},\
    \"TopicArn\":{\"type\":\"string\"},\
    \"TopicConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Events\"\
      ],\
      \"members\":{\
        \"Id\":{\"shape\":\"NotificationId\"},\
        \"TopicArn\":{\
          \"shape\":\"TopicArn\",\
          \"documentation\":\"<p>Amazon SNS topic ARN to which Amazon S3 will publish a message when it detects events of specified type.</p>\",\
          \"locationName\":\"Topic\"\
        },\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"locationName\":\"Event\"\
        },\
        \"Filter\":{\"shape\":\"NotificationConfigurationFilter\"}\
      },\
      \"documentation\":\"<p>Container for specifying the configuration when you want Amazon S3 to publish events to an Amazon Simple Notification Service (Amazon SNS) topic.</p>\"\
    },\
    \"TopicConfigurationDeprecated\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\"shape\":\"NotificationId\"},\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"locationName\":\"Event\"\
        },\
        \"Event\":{\
          \"shape\":\"Event\",\
          \"documentation\":\"<p>Bucket event for which to send notifications.</p>\",\
          \"deprecated\":true\
        },\
        \"Topic\":{\
          \"shape\":\"TopicArn\",\
          \"documentation\":\"<p>Amazon SNS topic to which Amazon S3 will publish a message to report the specified events for the bucket.</p>\"\
        }\
      }\
    },\
    \"TopicConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicConfiguration\"},\
      \"flattened\":true\
    },\
    \"Transition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Date\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.</p>\"\
        },\
        \"Days\":{\
          \"shape\":\"Days\",\
          \"documentation\":\"<p>Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.</p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"TransitionStorageClass\",\
          \"documentation\":\"<p>The class of storage used to store the object.</p>\"\
        }\
      }\
    },\
    \"TransitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Transition\"},\
      \"flattened\":true\
    },\
    \"TransitionStorageClass\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GLACIER\",\
        \"STANDARD_IA\",\
        \"ONEZONE_IA\"\
      ]\
    },\
    \"Type\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CanonicalUser\",\
        \"AmazonCustomerByEmail\",\
        \"Group\"\
      ]\
    },\
    \"URI\":{\"type\":\"string\"},\
    \"UploadIdMarker\":{\"type\":\"string\"},\
    \"UploadPartCopyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CopySourceVersionId\":{\
          \"shape\":\"CopySourceVersionId\",\
          \"documentation\":\"<p>The version of the source object that was copied, if you have enabled versioning on the source bucket.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-version-id\"\
        },\
        \"CopyPartResult\":{\"shape\":\"CopyPartResult\"},\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      },\
      \"payload\":\"CopyPartResult\"\
    },\
    \"UploadPartCopyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"CopySource\",\
        \"Key\",\
        \"PartNumber\",\
        \"UploadId\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"CopySource\":{\
          \"shape\":\"CopySource\",\
          \"documentation\":\"<p>The name of the source bucket and key name of the source object, separated by a slash (/). Must be URL-encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source\"\
        },\
        \"CopySourceIfMatch\":{\
          \"shape\":\"CopySourceIfMatch\",\
          \"documentation\":\"<p>Copies the object if its entity tag (ETag) matches the specified tag.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-match\"\
        },\
        \"CopySourceIfModifiedSince\":{\
          \"shape\":\"CopySourceIfModifiedSince\",\
          \"documentation\":\"<p>Copies the object if it has been modified since the specified time.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-modified-since\"\
        },\
        \"CopySourceIfNoneMatch\":{\
          \"shape\":\"CopySourceIfNoneMatch\",\
          \"documentation\":\"<p>Copies the object if its entity tag (ETag) is different than the specified ETag.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-none-match\"\
        },\
        \"CopySourceIfUnmodifiedSince\":{\
          \"shape\":\"CopySourceIfUnmodifiedSince\",\
          \"documentation\":\"<p>Copies the object if it hasn't been modified since the specified time.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-if-unmodified-since\"\
        },\
        \"CopySourceRange\":{\
          \"shape\":\"CopySourceRange\",\
          \"documentation\":\"<p>The range of bytes to copy from the source object. The range value must use the form bytes=first-last, where the first and last are the zero-based byte offsets to copy. For example, bytes=0-9 indicates that you want to copy the first ten bytes of the source. You can copy a range only if the source object is greater than 5 GB.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-range\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"PartNumber\":{\
          \"shape\":\"PartNumber\",\
          \"documentation\":\"<p>Part number of part being copied. This is a positive integer between 1 and 10,000.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"partNumber\"\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"documentation\":\"<p>Upload ID identifying the multipart upload whose part is being copied.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"uploadId\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header. This must be the same encryption key specified in the initiate multipart upload request.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"CopySourceSSECustomerAlgorithm\":{\
          \"shape\":\"CopySourceSSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use when decrypting the source object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-server-side-encryption-customer-algorithm\"\
        },\
        \"CopySourceSSECustomerKey\":{\
          \"shape\":\"CopySourceSSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-server-side-encryption-customer-key\"\
        },\
        \"CopySourceSSECustomerKeyMD5\":{\
          \"shape\":\"CopySourceSSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-copy-source-server-side-encryption-customer-key-MD5\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      }\
    },\
    \"UploadPartOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServerSideEncryption\":{\
          \"shape\":\"ServerSideEncryption\",\
          \"documentation\":\"<p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption\"\
        },\
        \"ETag\":{\
          \"shape\":\"ETag\",\
          \"documentation\":\"<p>Entity tag for the uploaded object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"ETag\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"SSEKMSKeyId\",\
          \"documentation\":\"<p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-aws-kms-key-id\"\
        },\
        \"RequestCharged\":{\
          \"shape\":\"RequestCharged\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-charged\"\
        }\
      }\
    },\
    \"UploadPartRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\",\
        \"PartNumber\",\
        \"UploadId\"\
      ],\
      \"members\":{\
        \"Body\":{\
          \"shape\":\"Body\",\
          \"documentation\":\"<p>Object data.</p>\",\
          \"streaming\":true\
        },\
        \"Bucket\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>Name of the bucket to which the multipart upload was initiated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Bucket\"\
        },\
        \"ContentLength\":{\
          \"shape\":\"ContentLength\",\
          \"documentation\":\"<p>Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Length\"\
        },\
        \"ContentMD5\":{\
          \"shape\":\"ContentMD5\",\
          \"documentation\":\"<p>The base64-encoded 128-bit MD5 digest of the part data.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-MD5\"\
        },\
        \"Key\":{\
          \"shape\":\"ObjectKey\",\
          \"documentation\":\"<p>Object key for which the multipart upload was initiated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Key\"\
        },\
        \"PartNumber\":{\
          \"shape\":\"PartNumber\",\
          \"documentation\":\"<p>Part number of part being uploaded. This is a positive integer between 1 and 10,000.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"partNumber\"\
        },\
        \"UploadId\":{\
          \"shape\":\"MultipartUploadId\",\
          \"documentation\":\"<p>Upload ID identifying the multipart upload whose part is being uploaded.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"uploadId\"\
        },\
        \"SSECustomerAlgorithm\":{\
          \"shape\":\"SSECustomerAlgorithm\",\
          \"documentation\":\"<p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-algorithm\"\
        },\
        \"SSECustomerKey\":{\
          \"shape\":\"SSECustomerKey\",\
          \"documentation\":\"<p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-sideâ-encryptionâ-customer-algorithm header. This must be the same encryption key specified in the initiate multipart upload request.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key\"\
        },\
        \"SSECustomerKeyMD5\":{\
          \"shape\":\"SSECustomerKeyMD5\",\
          \"documentation\":\"<p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-server-side-encryption-customer-key-MD5\"\
        },\
        \"RequestPayer\":{\
          \"shape\":\"RequestPayer\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-request-payer\"\
        }\
      },\
      \"payload\":\"Body\"\
    },\
    \"UserMetadata\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"MetadataEntry\",\
        \"locationName\":\"MetadataEntry\"\
      }\
    },\
    \"Value\":{\"type\":\"string\"},\
    \"VersionIdMarker\":{\"type\":\"string\"},\
    \"VersioningConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MFADelete\":{\
          \"shape\":\"MFADelete\",\
          \"documentation\":\"<p>Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.</p>\",\
          \"locationName\":\"MfaDelete\"\
        },\
        \"Status\":{\
          \"shape\":\"BucketVersioningStatus\",\
          \"documentation\":\"<p>The versioning state of the bucket.</p>\"\
        }\
      }\
    },\
    \"WebsiteConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorDocument\":{\"shape\":\"ErrorDocument\"},\
        \"IndexDocument\":{\"shape\":\"IndexDocument\"},\
        \"RedirectAllRequestsTo\":{\"shape\":\"RedirectAllRequestsTo\"},\
        \"RoutingRules\":{\"shape\":\"RoutingRules\"}\
      }\
    },\
    \"WebsiteRedirectLocation\":{\"type\":\"string\"}\
  }\
}\
";
}

@end
