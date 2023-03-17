package templates.thymeleaf.java_pratice.package_4;

class Circle {
    private double r;
    public Circle(double a) {
        r = a;
    }

    public double getArea() {
        return r*r*3.14;
    }

    public double getRadius() {
        return r;
    }
}

public class run {
    public static void main(String args[]) {
        // extends 부모 클래스
        // implements 인터페이스 이름
        Circle c = new Circle(5);
        System.out.println(c.getArea());
    }
}
