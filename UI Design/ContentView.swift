//
//  ContentView.swift
//  UI Design
//
//  Created by Md Khorshed Alam on 18/9/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
//        if currentPage > totalPage {
//            Home()
//        }else {
//            OnBoardScreen()
//        }
        //Ecommerce()
        //BottomBar()
        //LocalNotification()
        ScheduleNotification()
    }
}

#Preview {
    ContentView()
}
