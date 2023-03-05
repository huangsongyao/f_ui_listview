# uilistview_example

Demonstrates how to use the uilistview plugin.

## Getting Started

```
FUIListView(
          header: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 60),
            height: 500,
            color: Colors.cyan,
          ),
          footer: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 60),
            height: 500,
            color: Colors.deepOrange,
          ),
          builder: (BuildContext context, dynamic item, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(bottom: 40),
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Text(
                    'index = ${index.toString()} / text = ${item.toString()}'),
              ),
            );
          },
          data: const [1, 2, 3, 4, 5, 6],
        )
        
```