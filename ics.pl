#!/usr/bin/perl

use IO::Socket::INET;
use IO::Socket;

print q{
 ______   ____     ____        __  __                  __                   
/\__  _\ /\  _`\  /\  _`\     /\ \/\ \                /\ \__                
\/_/\ \/ \ \ \/\_\\ \,\L\_\   \ \ \_\ \  __  __    ___\ \ ,_\    __   _ __  
   \ \ \  \ \ \/_/_\/_\__ \    \ \  _  \/\ \/\ \ /' _ `\ \ \/  /'__`\/\`'__\
    \_\ \__\ \ \L\ \ /\ \L\ \   \ \ \ \ \ \ \_\ \/\ \/\ \ \ \_/\  __/\ \ \/ 
    /\_____\\ \____/ \ `\____\   \ \_\ \_\ \____/\ \_\ \_\ \__\ \____\\ \_\ 
    \/_____/ \/___/   \/_____/    \/_/\/_/\/___/  \/_/\/_/\/__/\/____/ \/_/ 

  ICS Hunter v1.0 [TCP]
    by : mohamadreza zamiri
         www.d3c0der.ir
    
};

start:

$host = $ARGV[0];
chomp $host;

print "\n Hunting started . . .\n";

@ports = ( 99, 102, 502, 530, 593, 1089, 1090, 1091, 1541, 3480, 4000, 4840, 5052, 5065, 5450, 10307, 10311, 10364, 10365, 10407, 10409,10410, 10412,10414, 10415, 10428, 10431, 10432, 10447, 10449, 10450, 11001, 12316, 12645, 12647, 12648, 13722, 11001, 12135, 12136, 12137, 13724, 13782, 13783, 18000, 20000, 34962, 34963, 34964, 38589, 38593, 38000, 38001, 38011, 38012, 38014, 38015, 38200, 38210, 38301,38400, 38600, 38700, 38971, 39129, 39278, 44818, 45678, 50001, 50002, 50003, 50004, 50005, 50006, 50007, 50008, 50009, 50010, 50011, 50012, 50013, 50014, 50015, 50016, 50018, 50019, 50020, 50025, 50026, 50027, 50028, 50110, 50111, 55555, 62900, 62911, 62924, 62930, 62938,62956, 62957, 62963, 62981, 62982, 62985, 62992, 63012, 63027, 63028, 63029,63030, 63031, 63032, 63033, 63034, 63035, 63036, 63041, 63075, 63079, 63082, 63088, 63094, 65443);

@names = ("Hw-group Poseidon", "ICCP and Siemens", "Modbus TCP", "RPC",

 "HTTP RPC", "Foundation Fieldbus HSE", "Foundation Fieldbus HSE", "Foundation Fieldbus HSE","Foxboro/Invensys Foxboro DCS Informix",

           "OPC UA Discovery Server", "Emerson/Fisher ROC Plus", "OPC UA Discovery Server", "Telvent OASyS DNA", "Telvent OASyS DNA",
          "Telvent OASyS DNA", 

        "OSIsoft PI Server",  "ABB Ranger 2003",
          "ABB Ranger 2003", "ABB Ranger 2003","ABB Ranger 2003", 

          "ABB Ranger 2003", "ABB Ranger 2003",
          "ABB Ranger 2003", "ABB Ranger 2003", "ABB Ranger 2003",

          "ABB Ranger 2003", "ABB Ranger 2003", "ABB Ranger 2003",
          "ABB Ranger 2003", "ABB Ranger 2003",

           "ABB Ranger 2003", "ABB Ranger 2003",
          "Johnson Controls Metasys", "ABB Ranger 2003", "ABB Ranger 2003",
          "ABB Ranger 2003", 

          "ABB Ranger 2003", "ABB Ranger 2003",
          "Johnson Controls Metasys N1", "Telvent OASyS DNA", "Telvent OASyS DNA",

           "Telvent OASyS DNA","ABB Ranger 2003", "ABB Ranger 2003",
            "ABB Ranger 2003", "Iconic Genesis32 GenBroker",

          "DNP3", "PROFINET", "PROFINET",
          "PROFINET", "ABB Ranger 2003",

           "ABB Ranger 2003",
          "SNC GENe", "SNC GENe", "SNC GENe", "SNC GENe",

           "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",
          "SNC GENe",

           "SNC GENe", "ABB Ranger 2003", "SNC GENe",
          "ABB Ranger 2003", "ABB Ranger 2003",

           "ABB Ranger 2003",
          "EtherNet/IP", "Foxboro/Invensys Foxboro DCS AIMAPI",
          "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",

          "Siemens Spectrum Power TG", "Siemens Spectrum Power TG", "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",
          "Siemens Spectrum Power TG",

           "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",
          "Siemens Spectrum Power TG", "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",

           "Siemens Spectrum Power TG",
          "Siemens Spectrum Power TG", "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",
          "Siemens Spectrum Power TG",

           "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",
          "Siemens Spectrum Power TG", "Siemens Spectrum Power TG", "Siemens Spectrum Power TG", 

          "Siemens Spectrum Power TG",
          "Siemens Spectrum Power TG", "Siemens Spectrum Power TG",
          "Foxboor/Invensys Foxboro DCS FoxAPI", "SNC GENe",

           "SNC GENe", "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",

          "SNC GENe", "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",

          "SNC GENe", "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",

          "SNC GENe", "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",

          "SNC GENe", "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",

          "SNC GENe", "SNC GENe",
          "SNC GENe", "SNC GENe", "SNC GENe",

          );

      
    

for ($z=0;$z<219;$z++) {
$n=0;
$port = @ports[$z];
$name = @names[$z];
$socket = IO::Socket::INET->new( PeerAddr => $host,
                          PeerPort => "$port",
                           Proto    => "tcp",
                           Timeout  => $timeout) || $n++;
                                                                            
                           
if ($n == 0) {

print (" open : "," $name " ," [on the port] ", "$port\n");

if ($socket)      {
$socket->recv($buffer,1024);
print (" [== banner ==] \n $buffer\n");
}

$n==0;
}
}

  for ($port=56001;$port<=56099;$port++) {
        $sock = IO::Socket::INET->new(PeerAddr => $host,
                                        PeerPort => $port,
                                        Proto => 'tcp');
        if ($sock)      {
        print (" open : Telvent OASyS DNA [on the port] ", "$port\n");
  }
  }

  
  
print "The end! press Enter To Restart the ProgRam\n";
$res = <stdin>;
goto start;