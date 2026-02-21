import SwiftUI

struct TaskItem: View {
    var taskItem: TaskAssignment

    // Card dimensions (kept from your capsule example)
    let cardWidth: CGFloat = 55
    let cardHeight: CGFloat = 75
    let verticalInset: CGFloat = 10
    let horizontalInset: CGFloat = 16

    // Rounded rectangle specific
    let cornerRadius: CGFloat = 12

    var body: some View {
        VStack(spacing: 6) {
            Image(taskItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: cardWidth * 0.7,
                       height: cardHeight * 0.5,
                       alignment: .top)
                .clipped()

            Text(taskItem.title)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)
        }
        .frame(width: cardWidth, height: cardHeight)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(Color.blue)
        )
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

#Preview {
    let test = TaskAssignment(title: "task", imageName: "cat-meme")
    TaskItem(taskItem: test)
}
