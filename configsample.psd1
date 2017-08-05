@{
    Exchange   = @{
        Nodes    = "Server1", "Server2"
        TestType = @{
            Be            = @{
                Running = @{
                    Services = @{
                        'Distributed Transaction Coordinator'           = "MSDTC"
                        'Microsoft Exchange Address Book'               = "MSExchangeAB"
                        'Microsoft Exchange Active Directory Topology'  = "MSExchangeADTopology"
                        'Microsoft Exchange Anti-spam Update'           = "MSExchangeAntispamUpdate"
                        'Microsoft Exchange EdgeSync'                   = "MSExchangeEdgeSync"
                        'Microsoft Exchange Forms-Based Authentication' = "MSExchangeFBA"
                        'Microsoft Exchange File Distribution'          = "MSExchangeFDS"
                        'Microsoft Exchange IMAP4'                      = "MSExchangeImap4"
                        'Microsoft Exchange Information Store'          = "MSExchangeIS"
                        'Microsoft Exchange Mailbox Assistants'         = "MSExchangeMailboxAssistants"
                        'Microsoft Exchange Mailbox Replication'        = "MSExchangeMailboxReplication"
                        'Microsoft Exchange Mail Submission'            = "MSExchangeMailSubmission"
                        'Microsoft Exchange Monitoring'                 = "MSExchangeMonitoring"
                        'Microsoft Exchange Protected Service Host'     = "MSExchangeProtectedServiceHost"
                        'Microsoft Exchange Replication'                = "MSExchangeRepl"
                        'Microsoft Exchange RPC Client Access'          = "MSExchangeRPC"
                        'Microsoft Exchange System Attendant'           = "MSExchangeSA"
                        'Microsoft Exchange Search Indexer'             = "MSExchangeSearch"
                        'Microsoft Exchange Service Host'               = "MSExchangeServiceHost"
                        'Microsoft Exchange Throttling'                 = "MSExchangeThrottling"
                        'Microsoft Exchange Transport'                  = "MSExchangeTransport"
                        'Microsoft Exchange Transport Log'              = "MSExchangeTransportLogSearch"
                    } # End Service Services
                } # End Service TestType Be Running
                Present = @{
                } # End Service TestType Be Present
            } # End Service TestType Be
            BeLessThan    = @{
                'Mail Queue' = "30"
            } # End Service TestType BeLessThan
            BeGreaterThan = @{

            } # End Service TestType BeGreaterThan
        } # End Service TestType
    } # End Service
    SharePoint = @{
        Nodes    = "Server3", "Server4"
        TestType = @{
            Be         = @{
                Running = @{
                    Services = @{
                        'Service Name'  = "ServiceName"
                        'Service Name2' = "ServiceName2"
                    } # End Service Services
                } # End Service TestType Be Running
                Present = @{
                } # End Service TestType Be Present
            } # End Service TestType Be
            BeLessThan = @{
            } # End Service TestType BeLessThan
        } # End Service TestType
    } # End Service
    AllNodes   = @{
        TestType = @{
            Be             = @{
                Running = @{
                    Services = @{
                        'AV Service'      = "AVService"
                        '3rd Party Agent' = "3rdPartyAgt"
                    } # End Service Services
                } # End AllNodes Running
            } # End AllNodes Be
            BeExactly      = @{
            } # End AllNodes BeExactly
            BeGreaterThan  = @{
                FreeDiskSpace = .10
            } # End AllNodes BeGreaterThan
            BeLessThan     = @{
            } # End AllNodes BeLessThan
            BeLike         = @{
                
            } # End AllNodes BeLike
            BeLikeExactly  = @{
                
            } # End AllNodes BeLikeExactly
            BeOfType       = @{
                
            } # End AllNodes BeOfType
            Exist          = @{
                
            } # End AllNodes Exist
            Contain        = @{
                
            } # End AllNodes Contain
            ContainExactly = @{

            } # End AllNodes ContainExactly
            Match          = @{
                
            } # End AllNodes Match
            MatchExactly   = @{
                
            } # End AllNodes MatchExactly
            Throw          = @{
                
            } # End AllNodes Throw
            BeNullOrEmpty  = @{
                
            } # End AllNodes BeNullOrEmpty
        } # End AllNodes TestType
    } # End AllNodes
} # End Configuration
