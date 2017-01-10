package m1;


import inet.examples.inet.ipv4hook.MyHost;
import inet.examples.inet.ipv4hook.MyRouter;
import inet.examples.wireless.hiddennode.SinkNode;
import inet.networklayer.common.InterfaceTable;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.gpsr.GPSRRouter;
import inet.node.inet.StandardHost;
//import inet.networklayer.ipv4.IPv4;
import inet.node.inet.Router;
import ned.DatarateChannel;


@license(LGPL);
//
// TODO documentation
//
network Network
{
    parameters:
        int n;

        @display("bgb=586,409");



    types:
        channel ethernet extends DatarateChannel
        {
            delay = 0;
            datarate = 10Mbps;
        }
        
         channel fiberrouter extends DatarateChannel
        {
            delay = 0;
            datarate = 512Mbps;
        }



    submodules:


        cl5[n]: StandardHost {
            @display("p=466,36");
        }
        cl2[n]: StandardHost {
            @display("p=377,28");
        }
        cl3[n]: StandardHost {
            @display("p=282,364");
        }
        cl4[n]: StandardHost {
            @display("p=102,351");
        }
        srv1: StandardHost {
            @display("p=50,83;i=device/server2");
        }
        router: Router {
            @display("p=114,154");
        }
        router1: Router {
            @display("p=411,123");
        }
        router2: Router {
            @display("p=422,234");
        }
        router3: Router {
            @display("p=243,263");
        }
        router4: Router {
            @display("p=338,312");
        }
        cl1[n]: StandardHost {
            @display("p=153,79");
        }
        router5: Router {
            @display("p=277,190");
        }
        router6: Router {
            @display("p=184,183");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=241,24");
        }
    connections:

        srv1.ethg++ <--> ethernet <--> router.ethg++;
        router2.ethg++ <--> ethernet <--> router1.ethg++;
        router2.ethg++ <--> ethernet <--> router4.ethg++;
        router3.ethg++ <--> ethernet <--> router5.ethg++;
        router5.ethg++ <--> ethernet <--> router2.ethg++;
        router.ethg++ <--> ethernet <--> router6.ethg++;
        router6.ethg++ <--> ethernet <--> router5.ethg++;
        router6.ethg++ <--> ethernet <--> router3.ethg++;

        for i=0..n-1 {
            router3.ethg++ <--> ethernet <--> cl4[i].ethg++;
            router1.ethg++ <--> ethernet <--> cl5[i].ethg++;
            router4.ethg++ <--> ethernet <--> cl3[i].ethg++;
            cl1[i].ethg++ <--> ethernet <--> router.ethg++;
            router1.ethg++ <--> ethernet <--> cl2[i].ethg++;
        }
}
