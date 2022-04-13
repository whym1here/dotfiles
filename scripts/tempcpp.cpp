#include<bits/stdc++.h>

using namespace std;

template<typename A, typename B>
ostream& operator<<(ostream& os, const pair<A, B>& p){
    return os << '(' << p.first << ", " << p.second << ')';
}

template<typename U, typename T = typename enable_if<!is_same<string, U>::value, typename U::value_type>::type>
ostream& operator<<(ostream& os, const U& v){
    os << '['; string sep = "";
    for(const T& e : v){
        os << sep << e;
        sep = ", ";
    }
    return os << ']';
}

void dbg_out(){
    cerr << '\n';
}

template<typename Heads, typename... Tails>
void dbg_out(const Heads& H, const Tails&... T){
    cerr << ' ' << H;
    dbg_out(T...);
}

#ifdef LOCAL
#define dbg(...) cerr << __LINE__ << "| " << #__VA_ARGS__ << " ="; dbg_out(__VA_ARGS__)
#else
#define dbg(...)
#endif

void solve(){
    
}

int main(){
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    
    int T = 1;
    cin >> T;
    for(int i = 1; i <= T; i++){
        // cout << "Case #" << tc << ": ";
        solve();
    }

    return 0;
}
