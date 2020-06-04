//
//  AppDelegate.swift
//  MultiPartGcodeSplicer
//
//  Created by Pavlo Havrylyuk on 5/19/20.
//  Copyright © 2020 Pavlo Havrylyuk. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBOutlet weak var filename_first: NSTextField!
    @IBOutlet weak var filename_repeat: NSTextField!
    @IBOutlet weak var filename_output: NSTextField!
    
    @IBOutlet weak var filename_output_name: NSTextField!
    @IBOutlet weak var x_multipart: NSTextField!
    
    @IBAction func firstgcodefileinput(_ sender: NSButton) {
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose your first Gcode File";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = false;
        dialog.canCreateDirectories    = false;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["gcode"];

        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
//            let urlwithext = Bundle.main.url(forResource: "soundfile.ext", withExtension: "")
//            urlwithext?.deletingPathExtension().lastPathComponent
//            let string = URL(fileURLWithPath: dialog.url) //path with file name

            if (result != nil) {
                let path = result!.path
                filename_first.stringValue = path
            }

//            filename_output_name.stringValue = ((urlwithext?.absoluteString ?? urlwithext?.absoluteString) as NSString).lastPathComponent
//            filename_output_name.stringValue = urlwithext

        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    @IBAction func repeatgcodefileinput(_ sender: NSButton) {
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose your repeat Gcode File";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = false;
        dialog.canCreateDirectories    = false;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["gcode"];

        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                filename_repeat.stringValue = path
            }
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    @IBAction func outputfilelocation(_ sender: NSButton) {
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a output folder";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["gcode"];

        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
//            let result = dialog.directoryURL // Pathname of the folder
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                filename_output.stringValue = path
            }
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    var stateofMultiExport = 1
    @IBAction func toggleMultiExport(sender: NSButton) {
        stateofMultiExport = sender.state.rawValue
    }
    

    @IBAction func splice_gcode(_ sender: NSButton) {
        sender.isEnabled = false
        let firstfilePath = URL(fileURLWithPath: filename_first.stringValue) //path with file name
        let repeatfilePath = URL(fileURLWithPath: filename_repeat.stringValue) //path with file name
        
        
        do{
            
            let firstGcodeContent = try String(contentsOf: firstfilePath, encoding: .utf8)
            let repeatGcodeContent = try String(contentsOf: repeatfilePath, encoding: .utf8)
            
            if(stateofMultiExport==0){
                let outputfilePath = filename_output.stringValue + "/" + filename_output_name.stringValue + "x" + String(x_multipart.intValue) + ".gcode" //path with file name and number of parts to print
                let outputfileUrl = URL(fileURLWithPath: outputfilePath) //path with directory
                print(outputfilePath)
                
                var outputFile = firstGcodeContent
                var i=0
                    
                while i<Int(x_multipart.intValue)-1 { //loop of copy and pastes
                        outputFile += repeatGcodeContent
                        i+=1
                    }
                FileManager.default.createFile(atPath: outputfilePath, contents: nil, attributes: nil)
                    
                try outputFile.write(to: outputfileUrl, atomically: true, encoding: .utf8)
            }
            else if(stateofMultiExport==1){
                var m=1
                while m<Int(x_multipart.intValue)+1{
                    var outputFile = String("")
                    outputFile = firstGcodeContent
                    let outputfilePath = filename_output.stringValue + "/" + filename_output_name.stringValue + "x" + String(m) + ".gcode" //path with file name and number of parts to print
                    let outputfileUrl = URL(fileURLWithPath: outputfilePath) //path with directory
                    print(outputfilePath)
                    var i=0
                    while i<m-1 { //loop of copy and pastes
                            outputFile += repeatGcodeContent
                            i+=1
                        }
                    FileManager.default.createFile(atPath: outputfilePath, contents: nil, attributes: nil)
                        
                    try outputFile.write(to: outputfileUrl, atomically: true, encoding: .utf8)
                    m+=1
                }
            }
            

//            let alert = NSAlert()
//            alert.messageText = "Completed Succsefully"
//            alert.beginSheetModal(for: window, completionHandler: nil)
//            alert.runModal()
            
        //Read and Write File
        } catch {
            print("ERROR")
//            let alert = NSAlert()
//            alert.messageText = "Error"
//            alert.beginSheetModal(for: window, completionHandler: nil)
//            alert.addButton(withTitle: "OK")
//            alert.runModal()
            
        }
        sender.isEnabled = true
    }//end splice_gcode
    
    
}

