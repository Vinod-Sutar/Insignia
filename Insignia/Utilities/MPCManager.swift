//
//  MPCManager.swift
//  BBConfigurator
//
//  Created by Vinod on 03/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import MultipeerConnectivity

protocol MPCManagerDelegate {
    
    func didConnectedPeersListUpdated()
}

class MPCManager: NSObject {
    
    var delegate: MPCManagerDelegate?
    
    var session: MCSession!
    
    var peerId: MCPeerID = MCPeerID(displayName:UIDevice.current.name)
    
    var advertiser: MCNearbyServiceAdvertiser!
    
    override init() {
        super.init()
        
        session = MCSession(peer: peerId)
        
        session.delegate = self
        
        advertiser = MCNearbyServiceAdvertiser(peer: peerId, discoveryInfo: nil, serviceType: "insignia")
        
        advertiser.delegate = self
        
        advertiser.startAdvertisingPeer()
    }
    
    func sendDataToConnectedPeers(_ dictionary: [String: Any]) {
        
        if session.connectedPeers.count > 0
        {
            let dataToSend = NSKeyedArchiver.archivedData(withRootObject: dictionary)
            
            do {
                
                try session.send(dataToSend, toPeers: session.connectedPeers, with: .reliable)
            }
            catch {
                
                print("Error")
            }
        }
    }
}

extension MPCManager: MCSessionDelegate {

    // Remote peer changed state.
    public func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    
    // Received data from remote peer.
    public func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    
    // Received a byte stream from remote peer.
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    
    // Start receiving a resource from remote peer.
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        
        if resourceName.hasPrefix("image--") {
            
            if resourceName.hasPrefix("image--appIcon_") {
                
                for app in AppListManager.shared.getApps() {
                    
                    let projectId = resourceName.replacingOccurrences(of: "image--appIcon_", with: "").replacingOccurrences(of: ".png", with: "")
                    
                    if app.projectId == projectId {
                        
                        app.setAppIcon(localURL)
                        
                        AppListManager.shared.reloadAppsList()
                    }
                }
            }
        }
        else if resourceName.hasPrefix("json--") {
            
            
            AppListManager.shared.saveAppsJson(url: localURL)
        }
        
        do {
            
            try FileManager.default.removeItem(at: localURL)
        }
        catch {
            
        }
    }
}

extension MPCManager: MCNearbyServiceAdvertiserDelegate {
    
    public func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        
    }

    
    // Incoming invitation request.  Call the invitationHandler block with YES
    // and a valid session to connect the inviting peer to the session.
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Swift.Void) {
        
        invitationHandler(true, session)
    }

}

