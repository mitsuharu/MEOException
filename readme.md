# MEOException


Swift で UITableView.reloadCells() などを行ったときのランタイム例外をキャッチする

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

未定


# License

MIT license





