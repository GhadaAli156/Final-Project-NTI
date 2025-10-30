import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

import '../../feature/authentication/models/user_model.dart';

class FirebaseDataBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel user = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      password: password,
      favList: [],
    );

    await _firestore.collection('users').doc(user.id).set(user.toMap());
    return user;
  }

  Future<UserModel> signIn(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DocumentSnapshot doc =
    await _firestore.collection('users').doc(credential.user!.uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }


  Future<UserModel?> getCurrentUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return null;

    DocumentSnapshot doc =
    await _firestore.collection('users').doc(currentUser.uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }


  Future<void> updateFavList(String userId, List<String> favList) async {
    await _firestore.collection('users').doc(userId).update({
      'favList': favList,
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }


  //Function to add Product to firebase
  Future<void> ProductToFirebase() async {
    final List<ProductModel> productsData = [
      // 👕 Clothes
      ProductModel(
        name: 'Casual T-Shirt',
        price: 29.99,
        image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800',
        description: 'Soft cotton T-shirt perfect for everyday wear.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Denim Jacket',
        price: 59.99,
        image: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=800',
        description: 'Stylish denim jacket for a cool look.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Summer Dress',
        price: 49.99,
        image: 'https://images.unsplash.com/photo-1520975918318-5b1a56b35ef9?w=800',
        description: 'Light and flowy dress for warm days.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Graphic Hoodie',
        price: 39.99,
        image: 'https://images.unsplash.com/photo-1520975918318-5b1a56b35ef9?w=800',
        description: 'Warm hoodie with a cool graphic print.',
        category: 'Clothes',
      ),

      // 👟 Shoes
      ProductModel(
        name: 'Running Sneakers',
        price: 79.99,
        image: 'https://images.unsplash.com/photo-1528701800489-20be9c1e09c7?w=800',
        description: 'Lightweight running shoes with great grip.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'White Casual Sneakers',
        price: 69.99,
        image: 'https://images.unsplash.com/photo-1528701800489-20be9c1e09c7?w=800',
        description: 'Trendy white sneakers that match any outfit.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'Leather Boots',
        price: 89.99,
        image: 'https://images.unsplash.com/photo-1528701800489-20be9c1e09c7?w=800',
        description: 'Durable leather boots for all seasons.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'High-Top Canvas Sneakers',
        price: 64.99,
        image: 'https://images.unsplash.com/photo-1528701800489-20be9c1e09c7?w=800',
        description: 'Stylish high-top sneakers for everyday wear.',
        category: 'Shoes',
      ),

      // ⌚ Watches
      ProductModel(
        name: 'Classic Leather Watch',
        price: 120.0,
        image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800',
        description: 'Elegant watch with a premium leather strap.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Smart Watch',
        price: 199.99,
        image: 'https://images.unsplash.com/photo-1519744346364-375f51eeea3c?w=800',
        description: 'Stay connected and track fitness with this smart watch.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Gold Wristwatch',
        price: 250.0,
        image: 'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?w=800',
        description: 'Luxury gold-plated wristwatch for special occasions.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Fitness Smartwatch',
        price: 149.99,
        image: 'https://images.unsplash.com/photo-1519744346364-375f51eeea3c?w=800',
        description: 'Smartwatch with fitness tracking and notifications.',
        category: 'Watches',
      ),

      // 👜 Bags
      ProductModel(
        name: 'Leather Handbag',
        price: 99.99,
        image: 'https://s.alicdn.com/@sc04/kf/H3445853a67034d678535459b352db2a8C.jpg?avif=close&webp=close',
        description: 'Stylish handbag crafted from genuine leather.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Travel Backpack',
        price: 79.99,
        image: 'https://brandsoutlet.com.pk/wp-content/uploads/2025/01/WhatsApp-Image-2025-01-19-at-22.09.36_51e6ca49-768x1021.jpg',
        description: 'Durable and spacious backpack for daily or travel use.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Mini Shoulder Bag',
        price: 49.99,
        image: 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=800',
        description: 'Compact and chic shoulder bag for casual outings.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Eco Leather Tote Bag',
        price: 119.99,
        image: 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=800',
        description: 'Large tote bag made from eco-friendly leather alternative.',
        category: 'Bags',
      ),
    ];

    for (var product in productsData) {
      await _firestore.collection('products').add(product.toJson());
    }
  }

  //get Products from firebase
  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('products').get();

    // Convert the documents to ProductModel objects
    List<ProductModel> products = querySnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return products;
  }
}

