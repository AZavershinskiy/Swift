//
//  ContentView.swift
//  HW_05
//
//  Created by Andrey Zavershinskiy on 02.12.2023.
//

import SwiftUI

struct FirstView: View {
	@State private var newsList = [NewsItem]()
	@State private var isShowingNewsList = false
	
	var body: some View {
		VStack {
			if isShowingNewsList {
				NavigationStack {
					List(newsList) { newsItem in
						NavigationLink(destination: NewsView(newsItem: newsItem)) {
							VStack(alignment: .leading) {
								Text(newsItem.title)
									.font(.headline)
									.fontWeight(.bold)
								Text(DateConverter().dateConvert(timeInterval: newsItem.publicationDate))
									.font(.subheadline)
									.foregroundColor(.gray)
							}
						}
					}
					.navigationBarTitle("Список новостей", displayMode: .inline)
					.onAppear {
						NetworkService().getNews{ item in
							DispatchQueue.main.async {
								newsList = item
							}
						}
					}
				}
			} else {
				Button(action: {
					isShowingNewsList = true
				}) {
					Text("НОВОСТИ")
						.font(.title)
						.foregroundColor(.white)
						.padding(.all, 5.0)
						.background(Color.blue)
						.cornerRadius(10)
				}
			}
		}
	}
}

struct NewsView: View {
	let newsItem: NewsItem
	
	var body: some View {
		VStack {
			Text(newsItem.title)
				.font(.title3)
				.fontWeight(.bold)
				.multilineTextAlignment(.center)
			Text(DateConverter().dateConvert(timeInterval: newsItem.publicationDate))
				.font(.subheadline)
				.foregroundColor(.gray)
				.padding(.bottom)
			Text(newsItem.bodyText == "" ? "НОВОСТИ БЕЗ ТЕКСТА" : newsItem.bodyText)
				.font(.body)
				.fontWeight(.medium)
			Spacer()
		}
		.navigationTitle("Детали")
		.padding(.horizontal, 10)
	}
}



#Preview {
	FirstView()
}
