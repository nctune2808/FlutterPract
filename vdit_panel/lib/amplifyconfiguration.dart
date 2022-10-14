const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "vditpanel": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://qpsw6xxf3vbvvgn6nxnpuofuva.appsync-api.eu-west-2.amazonaws.com/graphql",
                    "region": "eu-west-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-26eqgi4nhbcw5ayfnr2tuhmgp4"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://qpsw6xxf3vbvvgn6nxnpuofuva.appsync-api.eu-west-2.amazonaws.com/graphql",
                        "Region": "eu-west-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-26eqgi4nhbcw5ayfnr2tuhmgp4",
                        "ClientDatabasePrefix": "vditpanel_API_KEY"
                    },
                    "vditpanel_AWS_IAM": {
                        "ApiUrl": "https://qpsw6xxf3vbvvgn6nxnpuofuva.appsync-api.eu-west-2.amazonaws.com/graphql",
                        "Region": "eu-west-2",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "vditpanel_AWS_IAM"
                    },
                    "vditpanel_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://qpsw6xxf3vbvvgn6nxnpuofuva.appsync-api.eu-west-2.amazonaws.com/graphql",
                        "Region": "eu-west-2",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "vditpanel_AMAZON_COGNITO_USER_POOLS"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "eu-west-2:82a230cb-444c-4f27-929d-4db0cc278b6c",
                            "Region": "eu-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "eu-west-2_68mvFpkfK",
                        "AppClientId": "43h6kk9mjvuvggtm0m9etpfp8u",
                        "Region": "eu-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 6,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';