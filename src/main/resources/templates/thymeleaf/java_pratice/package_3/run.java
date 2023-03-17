package templates.thymeleaf.java_pratice.package_3;

import java.util.Scanner;

public class run {
    public static void main(String agrg[]) {
        String s1= "Java";
        String s2 = new String("Java");     // 생성자.

        System.out.println(s1);
        System.out.println(s2);

        Scanner sc = new Scanner(System.in);
        String name = sc.next();

        while(sc.hasNextInt()) {
            System.out.println(sc.nextInt());
        }
    }
}
