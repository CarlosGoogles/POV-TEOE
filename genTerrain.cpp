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

#define DIV 1.0
#define MAXN 100
#define MOD 1000000007

long double height[MAXN][MAXN];
long double triplete[MAXN][MAXN][MAXN];
int n, m;

void genPoints1(int i, int j) {
    double ii = ((double)(i)) / DIV, jj = (double)(j) / DIV;
    cout << "\t\t<" << ii << ", " << height[i][j] << ", " << jj << "> ";
    cout << "<" << ii << ", " << height[i][j+1] << ", " << jj+1 << "> ";
    cout << "<" << ii+1 << ", " << height[i+1][j] << ", " << jj << "> ";
    cout << endl;
}

void genPoints2(int i, int j) {
    double ii = ((double)(i)) / DIV, jj = (double)(j) / DIV;
    cout << "\t\t<" << ii << ", " << height[i][j+1] << ", " << jj+1 << "> ";
    cout << "<" << ii+1 << ", " << height[i+1][j+1] << ", " << jj+1 << "> ";
    cout << "<" << ii+1 << ", " << height[i+1][j] << ", " << jj << "> ";
    cout << endl;
}

void solve() {
    cout << "#include \"texturas.inc\"" << endl << endl;
    cout << "#declare O_Sand = merge {"  << endl;
    FOR(i, 0, n-1) {
        FOR(j, 0, m-1) {
            cout << "\ttriangle {" << endl;
            genPoints1(i, j);
            cout << "\t\ttexture {T_Sand}" << endl;
            cout << "\t}" << endl;
            cout << endl;

            cout << "\ttriangle {" << endl;
            genPoints2(i, j);
            cout << "\t\ttexture {T_Sand}" << endl;
            cout << "\t}" << endl;
            cout << endl;
        }
    }
    cout << "}"  << endl;
}

int main() { _
    /*
    string sNombre;
    cin >> sNombre;
    freopen((sNombre + ".in").c_str(), "r", stdin);
    freopen((sNombre + ".inc").c_str(), "w", stdout);
    */
    freopen("matrix_sand.in", "r", stdin);
    freopen("terrain_sand.inc", "w", stdout);
    cout << fixed << setprecision(5) << endl;



    cin >> n >> m;
    FOR(i, 0, n) {
        FOR(j, 0, m) {
            cin >> height[i][j];
            height[i][j] /= 25.0;
        }
    }

    solve();

    return 0;
}

