#!/usr/bin/perl


my $firstID =1005;
my $lastID =1055;
my $PPID = 1;

my $count2= 18;
my $count3= 0;
## start from count3.count4+1
my $BGPAS = 100;

my $host = "localhost";
my $usr = "";
my $pwd = "";
my $db = 'nms';         # target database name
use DBI();
# Connect to the database.
my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host",
                       $usr, $pwd,
                       { RaiseError => 1,
                         AutoCommit => 0
                       })|| die "Database connection not made: $DBI::errstr";

my $qry1 = "delete VLanPP.*  from VLanPP where VLanPP.PPID = $PPID and VLanPP.VLanID between $firstID and $lastID" ;
system("mysql $db -q -N --execute=\"$qry1\" ");
print "$qry1.\n";
my $qry2 = "delete VLanBlade.*  from VLanBlade where VLanBlade.PPID = $PPID and VLanBlade.VLanID between $firstID and $lastID" ;
system("mysql $db -q -N --execute=\"$qry2\" ");
print "$qry2.\n";
my $qry3 = "delete BGPPeer.*  from BGPPeer where BGPPeer.ParentId = $PPID and (BGPPeer.ParentType = 3 or BGPPeer.ParentType = 4) and BGPPeer.VLanID between $firstID and $lastID" ;
system("mysql $db -q -N --execute=\"$qry3\" ");
print "$qry3.\n";

my $qry13 = "SELECT PPBladeId from PPBlade where ProtocolProcessorId = $PPID";
my $sth = $dbh->prepare($qry13);
$sth->execute;
my $arref = $sth->fetchall_arrayref;
foreach $bladeid(@{$arref})
{
    print "blade id $bladeid->[0].\n";
}

$sth->finish();
print "$qry13.\n";
my $rows = $dbh->selectrow_array("SELECT COUNT(*) FROM PPBlade where ProtocolProcessorId = $PPID");
print "rows $rows.\n";

for($inx=$firstID; $inx<$lastID+1 ; $inx++)
{
    print "Current vlanId = $inx.\n";
    $count3++;
    while(IpInUse($count2,$count3))
    {                                                                                                                                               
                $count3++;                                                                                                                          
            if($count3 == 254)                                                                                                                      
                {                                                                                                                                   
                        $count3 = 1;                                                                                                                
                        $count2++;                                                                                                                  
                }                                                                                                                                   
    }                                                                                                                                               
                                                                                                                                                    
    my $qry4 = "INSERT INTO nms.VLanPP VALUES($inx,$PPID,1,'172.$count2.$count3.10','255.255.255.0','172.$count2.$count3.1',0,0,'New Vlan $inx')";
		system("mysql $db -q -N --execute=\"$qry4\" ");                                                                                             
		print "$qry4.\n";                                                                                                                           
                                                                                                                                                    
		my $qry5 = "INSERT INTO nms.VLanBlade VALUES($inx,$PPID,1, 1,'172.$count2.$count3.10','255.255.255.0','172.$count2.$count3.1',0,0,'New Vlan $inx')";
		system("mysql $db -q -N --execute=\"$qry5\" ");                                                                                         
		print "$qry5.\n";
     
}                                                                                                                                                   
                                                                                                                                                    
                                                                                                                                                    
# Disconnect from the database.                                                                                                                     
$dbh->disconnect();                                                                                                                                 
                                                                                                                                                    
print "Done.\n";                                                                                                                                    
                                                                                                                                                    
                                                                                                                                                    
sub IpInUse                                                                                                                                         
{                                                                                                                                                   
                                                                                                                                                    
                                                                                                                                                    
    my $count3 = $_[ 0 ];                                                                                                                           
    my $count4 = $_[ 1 ];                                                                                                                           
    my $return = 0;                                                                                                                                 
    my $qry1 = "select * from nms.VLanPP where IpAddr like '%172.$count2.$count3.10%';";                                                            
        print "$qry1.\n";                                                                                                                           
        my $sth = $dbh->prepare($qry1);                                                                                                             
        $sth->execute;                                                                                                                              
        my $arref = $sth->fetchrow_arrayref();                                                                                                      
        if($arref)                                                                                                                                  
        {                                                                                                                                           
                $return = 1;                                                                                                                        
        }                                                                                                                                           
        $sth->finish();                                                                                                                             
    print "ip in ise - $return.\n";                                                                                                                 
                                                                                                                                                    
                                                                                                                                                    
    return $return;                                                                                                                                 
}                                                                                                                                                   
                                                                                                                                                    
                                                                     
