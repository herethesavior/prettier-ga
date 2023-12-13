public with sharing class OverrideBothEqualsAndHashcode {
    public class Bar { // poor, missing a hashCode() method
        public Boolean equals(Object o) {
            // do some comparison
        }
    }
    public class Baz { // poor, missing an equals() method
        public Integer hashCode() {
            // return some hash value
        }
    }
    public class Foo { // perfect, both methods provided
        public Boolean equals(Object other) {
            // do some comparison
        }
        public Integer hashCode() {
            // return some hash value
        }
    }
}
