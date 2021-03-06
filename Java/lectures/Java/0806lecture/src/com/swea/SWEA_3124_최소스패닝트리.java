package com.swea;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.StringTokenizer;


public class SWEA_3124_최소스패닝트리 {
	static class Edge {
		int start;
		int end;
		int weight;

		public Edge(int start, int end, int weight) {
			super();
			this.start = start;
			this.end = end;
			this.weight = weight;
		}

		@Override
		public String toString() {
			return "Edge [start=" + start + ", end=" + end + ", weight=" + weight + "]";
		}
	}

	static ArrayList<Edge> edgeList;
	private static int[] parent;
	static int V, E;
	static StringTokenizer str;
	static int from, to, weight;

	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int t = Integer.parseInt(br.readLine());
		for (int tc = 1; tc <= t; tc++) {
			str = new StringTokenizer(br.readLine());
			V = Integer.parseInt(str.nextToken());
			E = Integer.parseInt(str.nextToken());
			parent = new int[V+1];
			edgeList = new ArrayList<Edge>();
			for (int i = 0; i < E; ++i) {
				str = new StringTokenizer(br.readLine().trim());
				from = Integer.parseInt(str.nextToken());
				to = Integer.parseInt(str.nextToken());
				weight = Integer.parseInt(str.nextToken());

				edgeList.add(new Edge(from, to, weight));

			}

			// 간선비용이 작은 순서대로 정렬
			// use Dynamic anonymous Class Object which implements Comparator Interface
			Collections.sort(edgeList, new Comparator<Edge>() {
				@Override
				public int compare(Edge o1, Edge o2) {
					return o1.weight - o2.weight;
				}
			});

			makeSet();

			long result = 0; // int 이면 패스 X
								// 각 케이스의 첫째 줄에는 정점의 개수 V(1≤V≤100,000)와 간선의 개수 E(1≤E≤200,000)가 주어진다.
								// C는 음수일 수도 있으며, 절대값이 1,000,000을 넘지 않는다.
								// int range : -2,147,483,648 to 2,147,483,647 (-2^31 to 2^31– 1).
			int count = 0; // 연결 간선수

			for (Edge edge : edgeList) {

				if (union(edge.start, edge.end)) { // 싸이클이 발생하지 않았으면
					result += edge.weight;
					if (++count == V - 1) { // 연결 간선수가 정점수-1이면 다 연결한 것임.
						break;
					}
				}
			}

			System.out.println("#" + tc + " " + result);
		}

	}

	public static void makeSet() {
		for (int i = 1; i <= V; i++) {
			parent[i] = i;
		}
	}

	public static int findSet(int x) {
		if (parent[x] == x)
			return x;// 자신이 루트이면 그냥 자신의 번호 리턴
		return parent[x] = findSet(parent[x]);
	}

	// boolean return 필요 - cycle 생성 여부 확인 필요
	public static boolean union(int x, int y) {
		int px = findSet(x);
		int py = findSet(y);

		if (px != py) { // 두 노드의 root가 다르면 합침
			parent[py] = px;
			return true;
		}

		return false; // 두 x, y 가 포함된 집합을 합칠 수 없다.--> 이미 같은 집합이다 / cycle 이 존재한다.
	}

}
