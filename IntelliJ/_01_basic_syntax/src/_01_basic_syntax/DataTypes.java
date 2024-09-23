package _01_basic_syntax;

// Reference Type (참조형)
// - java.lang.Object 클래스를 상속 받음
// - 기본형이 아니면 모두 참조형
public class DataTypes {
    public static void main(String[] args) {
        // Primitive Type (기본형)
        System.out.println("==== Primitive Type ====");

        // 정수형 변수 선언
        int x = 10; // 32bit
        long y = 1000000000L; // 64bit, long 타입은 뒤에 'L' 혹은 'l' 붙여야 함
        short z = 32767; // 16bit
        byte b = 127; // 8bit

        // 실수형 변수 선언
        float a = 3.14F; // 32bit, float 타입은 'F' 혹은 'f' 를 붙여야 함
        double c = 2.71828; // 64bit

        // 문자형 변수 선언
        char ch = 'A'; // 작은따옴표 사용

        // 논리형 변수
        boolean bool = true;

        // 변수 출력
        System.out.println("정수형 변수: " + x + ", " + y + ", " + z + ", " + b);
        System.out.println("실수형 변수: " + a + ", " + c);
        System.out.println("문자형 변수: " + ch);
        System.out.println("논리형 변수: " + bool);

        // Reference Type (참조형)
        System.out.println("==== Reference Type ====");

        // Java 에서 String 타입은 특별하게 다뤄짐 -> 참조형인데 기본형처럼 사용함
        String greeting = "Hello, World!";

        // 배열 (Array)
        int[] numbers = {1, 2, 3, 4, 5};

        // 클래스
        Person person = new Person("John", 30);

        // 참조형 변수 출력
        System.out.println("String 변수: " + greeting);
        System.out.println("배열 변수: ");
        for (int i = 0; i < numbers.length; i++) {
            System.out.println(numbers[i]);
        }
        System.out.println("Person 객체: " + person.getName() + ", " + person.getAge());
    }
}
