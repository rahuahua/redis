start_server {tags {"reference"}} {
    test {SETREF empty item} {
        r setref _non_exists_ref_obj {}
    } {0}

    test {SETREF an item} {
        r set x value_x
        r setref y x
    } {1}

    test {GET an item} {
        r get y
    } {value_x}

    test {GETREF an item} {
        r getref y
    } {x}

    test {DEL against a reference key} {
        r del y
        r get x
    } {}

    test {DEL against a referenced key} {
        r set x value_x
        r setref y x
        r del x
        r get y
    } {}

    test {DELREF against a reference key} {
        r set x value_x
        r setref y x
        r delref y
    } {1}

    test {GET a deleted reference item} {
       r get y
    } {}

    test {GETREF a deleted reference item} {
        r getref y
    } {}

    test {GET a item} {
        r get x
    } {value_x}
}
