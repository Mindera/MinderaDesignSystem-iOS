import SwiftUI

public class TabBarController<SelectionValue>: ObservableObject where SelectionValue: Hashable {
    @Binding public var selected: SelectionValue
    @Published public var isVisible = true

    public init(selected: Binding<SelectionValue>) {
        _selected = selected
    }
}

public struct TabBarView<SelectionValue>: View where SelectionValue: Hashable {
    private struct Tab {
        var selection: SelectionValue
        var icon: AnyView
        var text: AnyView
        var content: AnyView
    }

    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @ObservedObject
    private var controller: TabBarController<SelectionValue>
    private var tabs: [Tab] = []

    private init(controller: TabBarController<SelectionValue>, tabs: [Tab]) {
        self.controller = controller
        self.tabs = tabs
    }

    public init(selection: Binding<SelectionValue>) {
        controller = .init(selected: selection)
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxHeight: .infinity)
                .environmentObject(controller)
            bar
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxHeight: .infinity)
    }

    @ViewBuilder
    private var bar: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(Array(tabs.enumerated()), id: \.offset) { tab in
                Spacer()
                Button(action: {
                    controller.selected = tab.element.selection
                }) {
                    VStack {
                        tab.element.icon
                        tab.element.text
                    }
                }
            }
            Spacer()
        }
        .padding(.top, 12)
        .padding(.bottom, safeAreaInsets.bottom)
        .background(Color.greyBrown(._000))
        .offset(y: controller.isVisible ? 0 : 80)
        .animation(.easeInOut, value: controller.isVisible)
    }

    @ViewBuilder
    private var content: some View {
        ZStack {
            ForEach(tabs, id: \.selection) { tab in
                tab.content
                    .disabled(tab.selection != controller.selected)
                    .opacity(tab.selection == controller.selected ? 1 : 0)
                    .animation(.easeInOut(duration: 0.2), value: controller.selected)
            }
        }
    }

    public func tab<A: View, B: View, C: View>(
        _ selectionValue: SelectionValue,
        content: () -> A,
        icon: @autoclosure () -> B,
        text: @autoclosure () -> C
    ) -> TabBarView {
        let tab = Tab(
            selection: selectionValue,
            icon: AnyView(icon()),
            text: AnyView(text()),
            content: AnyView(content())
        )
        var tabs = tabs
        if let index = tabs.firstIndex(where: { tab in
            tab.selection == selectionValue
        }) {
            tabs.remove(at: index)
        }
        tabs.append(tab)
        return .init(controller: controller, tabs: tabs)
    }
}

// MARK: Previews

struct TabBarView_Previews: PreviewProvider {
    enum Tab {
        case dashboard
        case calendar
        case profile
    }

    struct Content: View {
        @State var selected: Tab = .dashboard
        var body: some View {
            TabBarView(selection: $selected)
                .tab(
                    .dashboard,
                    content: {
                        Text("Dashboard")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.red(._100))
                    },
                    icon: icon(systemName: "mappin.circle"),
                    text: EmptyView()
                )
                .tab(
                    .calendar,
                    content: {
                        Text("Calendar")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.indigo(._100))
                    },
                    icon: icon(systemName: "calendar"),
                    text: EmptyView()
                )
                .tab(
                    .profile,
                    content: {
                        VStack {
                            Text("Profile")
                            ContentButton()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.yellow(._100))
                    },
                    icon: icon(systemName: "person"),
                    text: EmptyView()
                )
        }

        private func icon(systemName: String) -> some View {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
    }

    struct ContentButton: View {
        @EnvironmentObject
        private var tabBarController: TabBarController<Tab>

        var body: some View {
            MinderaButton(
                .title(tabBarController.isVisible ? "Hide tab bar" : "Show tab bar"),
                action: {
                    tabBarController.isVisible.toggle()
                })
        }
    }

    static var previews: some View {
        Content()
    }
}
