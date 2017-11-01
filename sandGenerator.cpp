#include <bits/stdc++.h>

#define PI 3.14159265358979323846
#define EPS 1e-6
#define INF 1000000000

#define _ ios_base::sync_with_stdio(0), cin.tie(0), cin.tie(0), cout.tie(0), cout.precision(15);
#define FOR(i, a, b) for(int i=int(a); i<int(b); i++)
#define RFOR(i, a, b) for(int i=int(a)-1; i>=int(b); i--)
#define FORC(cont, it) for(typeof((cont).begin()) it = (cont).begin(); it != (cont).end(); it++)
#define RFORC(cont, it) for(typeof((cont).rbegin()) it = (cont).rbegin(); it != (cont).rend(); it++)
#define pb push_back

using namespace std;

typedef long long ll;
typedef pair<int, int> ii;
typedef vector<int> vi;

#define SCALE 1.0
#define MAXN 400
#define MOD 1000000007

long double height[MAXN][MAXN];
long double triplete[MAXN][MAXN][MAXN];
int n, m;

int main() { _
    freopen("Matrix_Sand_2.in", "w", stdout);
    cout << fixed << setprecision(5) << endl;

    n = 300;
    m = 300;
    cout << n << " " << m << endl;
    FOR(i, 0, n) {
        FOR(j, 0, m) {
            cout << rand() % 5 + 3 + 10.0 * i / n << " ";
        }
        cout << endl;
    }

    return 0;
}


