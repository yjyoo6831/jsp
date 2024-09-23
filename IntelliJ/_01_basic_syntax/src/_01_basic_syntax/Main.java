package _01_basic_syntax;// Primitive Type (기본형)

// - 사용되기 전에 선언되어야 하
// - "비객체" 타입 -> null 값 가질 수 없음

// 사용자 정의 클래스 (추후 배울 예정)
class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
}