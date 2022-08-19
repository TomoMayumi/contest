use proconio::input;

fn main() {
    input! {
        n: [u32;10],
    }
    let mut ans :u32 = 0;
    for _ in 1..=3 {
        //print!("{}->", ans);
        ans = n[ans as usize];
        //print!("{} ", ans);
    }
    println!("{}", ans);
}