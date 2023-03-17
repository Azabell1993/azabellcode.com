package templates.thymeleaf.java_pratice.package_two;

class Grade {
    int e;
    int m;

    void input_grade(int a, int b) {
        e = a;
        m = b;
    }

    void output_grade() {
        System.out.println(e+m);
    }
}

public class run {
    public static void main(String args[]) {
        Grade g1, g2;
        g1 = new Grade();
        g2 = new Grade();
        g1.input_grade(90, 85);
        g2.input_grade(80, 85);

        g1.output_grade();
        g2.output_grade();
    }
}
