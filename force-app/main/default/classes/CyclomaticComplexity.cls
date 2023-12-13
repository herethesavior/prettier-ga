public with sharing class CyclomaticComplexity {
    private Integer a;
    private Integer b;
    private Integer c;
    private Integer d;
    private Integer e;
    private Integer f;

    public void main(Integer z) {
        if (a == b || (c == d && e == f)) {
            if (a == e) {
                main(e);
            } else if (c == b) {
                main(b);
            } else {
                main(c);
            }
        } else if (c == d) {
            while (c == d) {
                main(d);
            }
        } else if (e == f) {
            for (Integer n = 0; n < e; n++) {
                main(f + n);
            }
        } else {
            switch on z {
                when 1 {
                    main(z);
                }
                when 2 {
                    main(z + 2);
                }
                when else {
                    main(0);
                }
            }
        }
    }

    public void example() {
        // This method has a cyclomatic complexity of 12
        int x = 0;
        int y = 1;
        int z = 2;
        int t = 2;

        boolean a = false;
        boolean b = true;
        boolean c = false;
        boolean d = true;

        if (a && b || b && d) {
            if (y == z) {
                x = 2;
            } else if (y == t && !d) {
                x = 2;
            } else {
                x = 2;
            }
        } else if (c && d) {
            while (z < y) {
                x = 2;
            }
        } else {
            for (int n = 0; n < t; n++) {
                x = 2;
            }
        }
    }
}
