package;

import openfl.display.Sprite;

class DListNode<T> extends Sprite implements ArrayAccess<T>
{
  public var parentNode:DListNode<T> = null;
  public var childNode:DListNode<T> = null;

  public function new()
  {
    super();
  }

  public function insertAfter( node:DListNode<T> )
  {
    //Structural
    if(node != null) node.childNode = childNode; else trace("node is null");
    if(childNode != null) childNode.parentNode = node; else trace("childNode is null");
    childNode = node;
    if(node != null ) node.parentNode = this;
    //SceneGraph
    addChild(node);
    if( node != null) node.addChild(node.childNode);
  }

  public function insertBefore( node:DListNode<T> )
  {
    //Structural
    if(node != null) node.parentNode = parentNode;
    if(parentNode != null) parentNode.childNode = node;
    parentNode = node;
    if(node != null) node.parentNode = this;
    //SceneGraph
    if(parentNode != null) parentNode.addChild(node);
    if(node != null) node.addChild(this);
  }

  public function remove()
  {
    //Structural
    if(childNode != null) childNode.parentNode = parentNode;
    if(parentNode != null) parentNode.childNode = childNode;
    //SceneGraph
    if(parentNode != null) parentNode.removeChild(this);
    if(parentNode != null) parentNode.addChild(childNode);
  }

}
