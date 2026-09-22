//
//  ProfileView.swift
//  SchoolConnectApp
//
//  Created by Aditya Maroo on 18/09/2026.
//


import SwiftUI

struct ProfileView: View {

    let profile: ProfileEntity

    var body: some View {

        VStack(spacing: 0) {

            // Keep your existing header if you have one
            // ProfileHeaderNavigationView()

            ScrollView(
                showsIndicators: false
            ) {

                VStack(
                    alignment: .leading,
                    spacing: 24
                ) {

                    ProfileHeaderView(
                        profile: profile
                    )

                    LinkedChildrenSection(
                        children: profile.linkedChildren,
                        onLinkChild: {
                            // Navigate to link child
                        }
                    )

                    SettingsSection(
                        onSelection: { setting in

                            handleSetting(
                                setting
                            )
                        }
                    )

                    LogoutButton {
                        // Logout
                    }

                    AppVersionView(
                        version: "School Connect v1.0.0 (MVP Phase 1)"
                    )
                }
                .padding(20)
            }
        }
        .background(
            Color(.systemGroupedBackground)
        )
    }

    private func handleSetting(
        _ setting: SettingType
    ) {

        switch setting {

        case .notification:
            break

        case .password:
            break

        case .language:
            break

        case .biometric:
            break

        case .help:
            break

        case .privacy:
            break

        case .terms:
            break
        }
    }
}


private struct ProfileHeaderView: View {

    let profile: ProfileEntity

    var body: some View {

        VStack(spacing: 7) {

            Text(profile.initials)
                .font(
                    .system(
                        size: 20,
                        weight: .bold
                    )
                )
                .foregroundColor(.white)
                .frame(
                    width: 58,
                    height: 58
                )
                .background(
                    Circle()
                        .fill(Color.blue)
                )

            Text(profile.name)
                .font(
                    .system(
                        size: 15,
                        weight: .bold
                    )
                )
                .foregroundColor(.primary)

            Text(profile.email)
                .font(.system(size: 10))
                .foregroundColor(.secondary)
        }
        .frame(
            maxWidth: .infinity
        )
    }
}

private struct LinkedChildrenSection: View {

    let children: [LinkedChildEntity]
    let onLinkChild: () -> Void

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            Text("Linked Children")
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            LazyVStack(spacing: 9) {

                ForEach(children) { child in

                    LinkedChildCard(
                        child: child
                    )
                }
            }

            LinkAnotherChildButton {
                onLinkChild()
            }
        }
    }
}




private struct LinkAnotherChildButton: View {

    let action: () -> Void

    var body: some View {

        Button {
            action()
        } label: {

            Text("+ Link Another Child")
                .font(
                    .system(
                        size: 10,
                        weight: .semibold
                    )
                )
                .foregroundColor(.blue)
                .frame(
                    maxWidth: .infinity
                )
                .frame(height: 32)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(
                        cornerRadius: 7
                    )
                    .stroke(
                        Color.blue,
                        lineWidth: 1
                    )
                )
        }
        .buttonStyle(.plain)
    }
}

private struct SettingsSection: View {

    let onSelection: (SettingType) -> Void

    private let settings: [SettingItemEntity] = [

        SettingItemEntity(
            title: "Notification Preferences",
            icon: "bell.fill",
            iconBackground: Color.blue.opacity(0.08),
            type: .notification
        ),

        SettingItemEntity(
            title: "Change Password",
            icon: "lock.fill",
            iconBackground: Color.yellow.opacity(0.12),
            type: .password
        ),

        SettingItemEntity(
            title: "Language",
            icon: "globe",
            iconBackground: Color.cyan.opacity(0.10),
            type: .language
        ),

        SettingItemEntity(
            title: "Biometric Login",
            icon: "faceid",
            iconBackground: Color.purple.opacity(0.08),
            type: .biometric
        ),

        SettingItemEntity(
            title: "Help & Support",
            icon: "questionmark",
            iconBackground: Color.clear,
            type: .help
        ),

        SettingItemEntity(
            title: "Privacy Policy",
            icon: "doc.fill",
            iconBackground: Color.clear,
            type: .privacy
        ),

        SettingItemEntity(
            title: "Terms of Service",
            icon: "calendar",
            iconBackground: Color.clear,
            type: .terms
        )
    ]

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            Text("Settings")
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )

            VStack(spacing: 0) {

                ForEach(settings) { setting in

                    SettingRowView(
                        setting: setting
                    ) {
                        onSelection(
                            setting.type
                        )
                    }
                    Divider()
                }
            }
        }
    }
}


private struct LogoutButton: View {

    let action: () -> Void

    var body: some View {

        Button {
            action()
        } label: {

            Text("Log Out")
                .font(
                    .system(
                        size: 12,
                        weight: .bold
                    )
                )
                .foregroundColor(.white)
                .frame(
                    maxWidth: .infinity
                )
                .frame(height: 38)
                .background(
                    RoundedRectangle(
                        cornerRadius: 8
                    )
                    .fill(Color.red)
                )
        }
        .buttonStyle(.plain)
    }
}


private struct AppVersionView: View {

    let version: String

    var body: some View {

        Text(version)
            .font(.system(size: 8))
            .foregroundColor(.secondary)
            .frame(
                maxWidth: .infinity
            )
    }
}


#Preview {
    ProfileView(profile: .mock)
}
