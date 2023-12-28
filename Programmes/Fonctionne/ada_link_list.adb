with Ada.Text_IO; use Ada.Text_IO;

procedure Ada_Link_List is

  type Node;
  type Node_Ptr is access Node;
  type Node is record
    Id: Integer;
    Value: Integer;
    Next: Node_Ptr := null;
  end record;

  procedure Print_List(Node: in Node_Ptr) is
  Temp : Node_Ptr := Node;
  begin
    while Temp /= null loop
      --put("Id: " & Temp.Id'Image);
      --put(", Value: " & Temp.Value'Image);
      --Ada.Text_IO.New_Line;

      Temp := Temp.Next;
    end loop;
  end Print_List;

  procedure Append_Node(Id: Integer; Value: Integer; New_Node: in out Node_Ptr) is
    Temp : Node_Ptr := New_Node;
  begin
    if Temp = null then
        New_Node := new Node'(Id, Value, null);
        --put("Adding Head node");
        --Ada.Text_IO.New_Line;
    else
        while Temp.Next /= null loop
          Temp := Temp.Next;
        end loop;
        --put("Adding Next node");
        --Ada.Text_IO.New_Line;
        Temp.Next := new Node'(Id, Value, null);
    end if;
  end Append_Node;

  Head : Node_Ptr := null;

begin
  Append_Node(1, 1, Head);
  Append_Node(2, 2, Head);
  Append_Node(3, 3, Head);
  Append_Node(4, 4, Head);
  Append_Node(5, 5, Head);
  Print_List(Head);
  Append_Node(6, 6, Head);
  Print_List(Head);
end Ada_Link_List;
