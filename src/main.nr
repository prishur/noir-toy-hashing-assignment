global PRIME: u32 = 16777619;
global INITIAL_VALUE: u32 = 0x811C9DC5;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

//FNV Hash Algorithm
fn calculate_hash(num: u32) -> u32 {
    let byte_count = 4; //4 bytes in our u32 number
    let bytes = (num as Field).to_be_bytes(byte_count);

    let mut hash_value = INITIAL_VALUE;
    for i in 0..byte_count {
        let product_modulus = (hash_value * PRIME);
        hash_value = (bytes[i] as u32) ^ product_modulus;
    }
    hash_value
}

#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
