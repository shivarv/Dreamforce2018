/**
 * @description       : 
 * @author            : Shiva Rajendran Viji
 * @group             : 
 * @last modified on  : 03-26-2025
 * @last modified by  : Shiva Rajendran Viji
**/
@isTest
public class HelloWorldTest {
    @isTest
    private static void testSample() {
        HelloWorld.hello();
        System.assert(true);
    }

    @isTest
    private static void testSample() {
        integer output = HelloWorld.add(2, 3);
        System.assertEquals(5, output);
    }
}