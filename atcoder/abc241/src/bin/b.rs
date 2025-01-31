use proconio::input;

fn main() {
    input! {
        n:u32,
        m:u32,
        a:[u32;n],
        b:[u32;m],
    }
    let mut ans :u32 = 0;
    for _ in 1..=3 {
        //print!("{}->", ans);
        ans = a[ans as usize];
        //print!("{} ", ans);
    }
    println!("{}", ans);
}