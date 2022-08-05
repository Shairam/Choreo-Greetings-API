import ballerina/log;
import ballerina/http;

configurable int tokenX = 123;
configurable string sample = "Hello World";
# A service representing a network-accessible API
# bound to port `9090`.

configurable string greeting = "Finally";

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            log:printInfo(sample);
            return error("name should not be empty!");
        }
        log:printInfo(sample);
        log:printInfo(tokenX.toString());
        return "Hello, " + name + " " + greeting;
    }
}
