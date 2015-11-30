import UIKit

class ViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .redColor()
		tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
		let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
		tableView.contentInset = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
		cell.configure("Some Stuff",
			purple: "SomeStuff that is really long and takes up a lot of room on the screen and maybe breaks onto a second line maybe if I just keep typing i will get a banana")
		return cell
	}

	override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}

}

class CustomCell: UITableViewCell {

	let label1 = UILabel(frame: CGRect.zero) //since they will be sized by autolayout
	let label2 = UILabel(frame: CGRect.zero)
	let stack: UIStackView

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

		label1.backgroundColor = .blueColor()
		label1.translatesAutoresizingMaskIntoConstraints = false

		label2.backgroundColor = .purpleColor()
		label2.numberOfLines = 0
		label2.translatesAutoresizingMaskIntoConstraints = false

		stack = UIStackView(arrangedSubviews: [label1, label2])
		stack.axis = .Vertical
		stack.distribution = UIStackViewDistribution.EqualCentering
		stack.spacing = 8
		stack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		stack.layoutMarginsRelativeArrangement = true
		stack.translatesAutoresizingMaskIntoConstraints = false

		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.backgroundColor = .greenColor()
		contentView.addSubview(stack)
	}

	override func updateConstraints() {
		//constrain stack to fill contentView
		stack.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
		stack.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
		stack.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor).active = true
		stack.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
		super.updateConstraints()
	}

	func configure(blue: String, purple: String){
		label1.text = blue
		label2.text = purple
		setNeedsUpdateConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}

