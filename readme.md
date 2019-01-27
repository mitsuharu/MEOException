# MEOException


Swift で UITableView.reloadRows() などを行ったときのランタイム例外をキャッチする．

(en) It catches runtime exception e.g. UITableView.reloadRows() in Swift. 

## UITableView

- reload(Rows|Sections)
- insert(Rows|Sections)
- delete(Rows|Sections)
- move(Rows|Sections)

## Samples

```Swift
let indexPath = IndexPath(row: 100, section: 100)
self.tableView.exc.reloadRows(at: [indexPath], with: .automatic) { (exception) in
    print("exception:\(exception)")
}         
```

# Installation


## Carthage

```
github "mitsuharu/MEOException"
```

## CocoaPods

not yet


# License

MIT license





