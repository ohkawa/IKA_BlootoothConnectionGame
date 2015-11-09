//
//  NearbyManager.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import MultipeerConnectivity

class NearbyManager : NSObject, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
    
    static let sharedInstance = NearbyManager()
    var canvasVC : CanvasVC?


    let serviceType = "IKA"
    var peerID: MCPeerID!
    var session : MCSession!
    
    var assistant : MCNearbyServiceAdvertiser!

    var browser : MCNearbyServiceBrowser!
    
    // --------------------------------------------------------------------- //
    // MARK: - Life Cycle
    func initialize() {
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        
        self.assistant = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        self.assistant.delegate = self
        self.assistant.startAdvertisingPeer()
        
        self.browser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        self.browser.delegate = self
        self.browser.startBrowsingForPeers()
    }
    
    deinit {
        self.browser.stopBrowsingForPeers()
        self.assistant.stopAdvertisingPeer()
        self.session.disconnect()
    }
    
    // --------------------------------------------------------------------- //
    // MARK: -
    func sendMessage(point : PointModel) {
        do {
            let data = NSKeyedArchiver.archivedDataWithRootObject(point)
            try self.session.sendData(data,
                toPeers: self.session.connectedPeers,
                withMode: MCSessionSendDataMode.Unreliable)
        } catch {
            print(error)
        }
        // do
    }
    
    // --------------------------------------------------------------------- //
    // MARK: - MCNearbyServiceBrowserDelegate
    func browser(browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        let data = NSKeyedArchiver.archivedDataWithRootObject(GameConditionManager.sharedInstance.uuid)
        self.browser.invitePeer(peerID, toSession: session, withContext: data, timeout: 10)
    }
    
    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print(peerID)
    }
    
    // --------------------------------------------------------------------- //
    // MARK: - MCNearbyServiceAdvertiserDelegate
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: NSData?, invitationHandler: (Bool, MCSession) -> Void)
    {
        print(peerID)
        print(context?.description)
        print(invitationHandler)
        invitationHandler(true, self.session);
        
        let opponentUuid = NSKeyedUnarchiver.unarchiveObjectWithData(context!) as! String
        GameConditionManager.sharedInstance.opponentUuid = opponentUuid
    }
    
    // --------------------------------------------------------------------- //
    // MARK: - MCSessionDelegate
    
    func session(session: MCSession, didReceiveData data: NSData,
        fromPeer peerID: MCPeerID)  {
            // Called when a peer sends an NSData to us
            // This needs to run on the main queue
            dispatch_async(dispatch_get_main_queue()) {
                let point = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! PointModel
                print(point.point.x, point.point.y)
                self.canvasVC?.paintEnemyPuddle(point)
            }
    }
    
    // The following methods do nothing, but the MCSessionDelegate protocol
    // requires that we implement them.
    func session(session: MCSession,
        didStartReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID, withProgress progress: NSProgress)  {
            
            // Called when a peer starts sending a file to us
    }
    
    func session(session: MCSession,
        didFinishReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        atURL localURL: NSURL, withError error: NSError?)  {
            // Called when a file has finished transferring from another peer
    }
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream,
        withName streamName: String, fromPeer peerID: MCPeerID)  {
            // Called when a peer establishes a stream with us
    }
    
    func session(session: MCSession, peer peerID: MCPeerID,
        didChangeState state: MCSessionState)  {
            // Called when a connected peer changes state (for example, goes offline)
            
    }
}

